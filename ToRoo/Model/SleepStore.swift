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

