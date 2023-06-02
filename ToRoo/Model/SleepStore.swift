//
//  SleepStore.swift
//  beSafik
//
//  Created by Safik Widiantoro on 27/05/23.
//

import HealthKit


struct SleepStore {
    var healthStore: HKHealthStore?
    var query: HKStatisticsCollectionQuery?
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
    
    func saveSleepAnalysis() {
        guard let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else {
                return
            }
            
        let inBedObject = HKCategorySample(type: sleepType, value: HKCategoryValueSleepAnalysis.InBed.rawValue, start: Date(), end: Date())
        let asleepREMObject = HKCategorySample(type: sleepType, value: HKCategoryValueSleepAnalysis.asleepREM .rawValue, start: Date(), end: Date())
            
            let saveCompletionHandler: (Bool, Error?) -> Void = { success, error in
                if let error = error {
                    // Handle error
                    print("Error: \(error.localizedDescription)")
                } else if success {
                    // Saved successfully
                    print("Data saved in HealthKit")
                } else {
                    // Saving failed
                    print("Failed to save data in HealthKit")
                }
            }
            
            healthStore?.save(inBedObject, withCompletion: saveCompletionHandler)
            healthStore?.save(asleepREMObject, withCompletion: saveCompletionHandler)
    }
    
    //Reading sleep Analysis Data
    func retrieveSleepAnalysis() {
        
        // first, we define the object type we want
        if let sleepType = HKObjectType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis) {
            
            // Use a sortDescriptor to get the recent data first
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierEndDate, ascending: false)
            
            // we create our query with a block completion to execute
            let query = HKSampleQuery(sampleType: sleepType, predicate: nil, limit: 30, sortDescriptors: [sortDescriptor]) { (query, tmpResult, error) -> Void in
                
                if error != nil {
                    
                    // something happened
                    return
                    
                }
                
                if let result = tmpResult {
                    
                    // do something with my data
                    for item in result {
                        if let sample = item as? HKCategorySample {
                            let value = (sample.value == HKCategoryValueSleepAnalysis.InBed.rawValue) ? "InBed" : "Asleep"
                            print("Healthkit sleep: \(sample.startDate) \(sample.endDate) - value: \(value)")
                        }
                    }
                }
            }
            
            // finally, we execute our query
            healthStore?.execute(query)
        }
    }
    
    
    func displaySleepStages() async{
        let sleepSampleType = HKCategoryType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis)!
        
        
        
        //        let stagePredicate = HKCategoryValueSleepAnalysis.predicateForSamples(.equalTo, value: .asleepREM)
        //
        //        let queryPredicate = HKSamplePredicate.sample(type: HKCategoryType(.sleepAnalysis), predicate: stagePredicate)
        //
        //        let sleepQuery = HKSampleQueryDescriptor(predicates: [queryPredicate], sortDescriptors: [])
        //
    }
    
    
    func requestAuthorization(completion: @escaping (Bool) -> Void) {
        
        let readSleep = HKCategoryType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis)!
        let shareSleep = HKCategoryType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis)!
        //        let sleepCategory = HKCategoryValueSleepAnalysis.asleepDeep.rawValue
        //        let deepSleepSample  = HKCategorySample(type: sleepSampleType,
        //                                                value:sleepCategory,
        //                                                start: Date()-7,
        //                                                end: Date())
        
        guard let healthStore = self.healthStore else {return completion(false)}
        
        healthStore.requestAuthorization(toShare: [shareSleep], read: [readSleep], completion: {(success, error) in
            completion(success)
        })
    }
    
    
}

