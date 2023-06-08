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

func date(year: Int, month: Int, day: Int = 1, hour: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date {
    Calendar.current.date(from: DateComponents(year: year, month: month, day: day, hour: hour, minute: minutes, second: seconds)) ?? Date()
}

struct SleepEntry: Identifiable, Equatable{
    var id = UUID()
    let startDate: Date
    let endDate: Date
    let sleepStages: String
    let duration: TimeInterval
}

enum Constants {
    static let previewChartHeight: CGFloat = 100
    static let detailChartHeight: CGFloat = 300
}
