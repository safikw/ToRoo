//
//  SleepEnum.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 31/05/23.
//

import Foundation

public enum HKCategoryValueSleepAnalysis : Int {
    case InBed
    
    case asleepUnspecified
    
    case awake
    
    case asleepCore
    
    case asleepDeep
    
    case asleepREM
}

struct SleepEntry: Identifiable {
    var id = UUID()
    let startDate: Date
    let endDate: Date
    let sleepStages: HKCategoryValueSleepAnalysis
    let duration: TimeInterval
}

