//
//  SleepStore.swift
//  beSafik
//
//  Created by Safik Widiantoro on 27/05/23.
//

import HealthKit



struct SleepStore {
    var healthStore: HKHealthStore?
    
    
    
    
    
    init() {
        if HKHealthStore.isHealthDataAvailable() {
            healthStore = HKHealthStore()
        }
    }
    
    
    
    
    //    func todaySleep(){
    //                let sleepSampleType = HKCategoryType.categoryType(forIdentifier: HKCategoryTypeIdentifier.sleepAnalysis)!
    //        guard let sleepType = HKObjectType.categoryType(forIdentifier: .sleepAnalysis) else {
    //            print("Sleep analysis is not available.")
    //            return
    //        }
    //        let startDate = Calendar.current.startOfDay(for: Date())
    //        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
    //        var interval = DateComponents()
    //        interval.day = 1
    //
    //        let query = HKStatisticsCollectionQuery(quantityType: sleepType, quantitySamplePredicate: predicate, options: [.cumulativeSum],anchorDate: startDate, intervalComponents: interval)
    //
    //        query.initialResultsHandler = {
    //            query, result, error in
    //
    //            if let myresult = result {
    //                myresult.enumerateStatistics(from: startDate, to: Date()) {(statistic, value) in
    //                    if let count = statistic.sumQuantity() {
    //                        let val = count.doubleValue(for: HKUnit.count())
    //                        print("Total sleep taken today is \(val)")
    //                    }
    //                }
    //            }
    //        }
    //        healthStore?.execute(query)
    //    }
    
    

}
    


