//
//  SleepFilteringFunc.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 11/06/23.
//

import Foundation


struct SleepFilteringFunc {

    static func startOfOpeningHours(selectedDate: Date) -> Date{
        let dayChart = selectedDate.toString(format: "dd")
        let monthChart = selectedDate.toString(format: "MM")
        let yearChart = selectedDate.toString(format: "yyyy")
        let startTime = date(year: Int(yearChart)!, month: Int(monthChart)!, day: Int(dayChart)!, hour: 00, minutes: 00)
        
        return startTime
    }
    
    static func endOfOpeningHours(selectedDate: Date) -> Date {
        let dayChart = selectedDate.toString(format: "dd")
        let monthChart = selectedDate.toString(format: "MM")
        let yearChart = selectedDate.toString(format: "yyyy")
        let endTime = date(year: Int(yearChart)!, month: Int(monthChart)!, day: Int(dayChart)!, hour: 23, minutes: 59)
        
        return endTime
    }
}


