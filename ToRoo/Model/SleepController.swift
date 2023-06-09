//
//  SleepStore.swift
//  beSafik
//
//  Created by Safik Widiantoro on 27/05/23.
//

import HealthKit



class SleepStore: ObservableObject {
    @Published var healthStore: HKHealthStore?
    @Published var sleepData: [SleepEntry] = []
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    func formatDuration(_ duration: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        return formatter.string(from: duration) ?? ""
    }
    
    func requestAuthorization() {
        let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!
        healthStore?.requestAuthorization(toShare: nil, read: [sleepType]) { success, error in
            if error != nil {
                print("Request auth for sleeping data can't ")
                return
            }
            
            if success {
                // Authorization granted, fetch sleep analysis data
                self.fetchSleepAnalysis()
            } else {
                // Authorization denied
            }    }
    }
    
    func fetchSleepAnalysis() {
        
        guard let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else {
            // Sleep analysis not available
            print("Sleep analysis not available")
            return
        }
        
        let query = HKSampleQuery(sampleType: sleepType, predicate: nil, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { query, results, error in
            if error != nil {
                // Handle error
                return
            }
            
            if let sleepSamples = results as? [HKCategorySample] {
                // Process sleep samples
                self.processSleepSamples(sleepSamples)
            }
        }
        
        healthStore?.execute(query)
    }
    
    
    
    
    func processSleepSamples(_ samples: [HKCategorySample]) {
        var sleepData: [SleepEntry] = []
        
        for sample in samples {
            let startDate = sample.startDate
            let endDate = sample.endDate

            
            // Determine the sleep quality based on the value of the sample
            let sleepStages: String
            switch sample.value {
            case HKCategoryValueSleepAnalysis.InBed.rawValue:
                sleepStages = "In Bed"
            case HKCategoryValueSleepAnalysis.awake.rawValue:
                sleepStages = "Awake"
            case HKCategoryValueSleepAnalysis.asleepREM.rawValue:
                sleepStages = "REM"
            case HKCategoryValueSleepAnalysis.asleepDeep.rawValue:
                sleepStages = "Deep"
            case HKCategoryValueSleepAnalysis.asleepCore.rawValue:
                sleepStages = "Core"
            default:
                sleepStages = "Unspecified"
            }
            
            // Calculate the duration of the sleep sample
            let duration = endDate.timeIntervalSince(startDate)
            
            let filteredEntries = sleepData.filter { entry in
                entry.startDate >= startDate && entry.endDate <= endDate && entry.sleepStages != "Unspecified" && entry.sleepStages != "In Bed"
            }
            

            let totalDuration = filteredEntries.reduce(0) { $0 + $1.duration }
            let percentage = duration / totalDuration * 100
            
            // Create a SleepEntry object and add it to the sleepData array
            let sleepEntry = SleepEntry(id: UUID(), startDate: startDate, endDate: endDate, sleepStages: sleepStages, duration: duration, percentage: percentage)
            
            sleepData.append(sleepEntry)
//            print(sleepData)
        }
        
        DispatchQueue.main.async {
            // Update your SwiftUI view with the processed sleep data on the main thread
            self.sleepData = sleepData
        }
    }
    
    
    
    
}



