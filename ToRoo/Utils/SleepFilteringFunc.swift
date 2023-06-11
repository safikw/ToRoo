//
//  SleepFilteringFunc.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 11/06/23.
//

import Foundation


struct SleepFilteringFunc {
//    var selectedDay: Date

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
    
    static func calculateInBed(sleepData: [SleepEntry],selectedDay: Date) -> Double {
        let filteredEntriesInBed = sleepData.filter { entry in
            entry.startDate >= SleepFilteringFunc.startOfOpeningHours(selectedDate: selectedDay) && entry.endDate <= SleepFilteringFunc.endOfOpeningHours(selectedDate: selectedDay) && entry.sleepStages == "In Bed"
        }
        let totalInBedDuration = filteredEntriesInBed.reduce(0) { $0 + $1.duration }
        
        return totalInBedDuration
    }
    
    static func calculateTotal(sleepData: [SleepEntry],selectedDay: Date) -> Double{
        let filteredEntries = sleepData.filter { entry in
            entry.startDate >= SleepFilteringFunc.startOfOpeningHours(selectedDate: selectedDay) && entry.endDate <= SleepFilteringFunc.endOfOpeningHours(selectedDate: selectedDay) && entry.sleepStages != "Unspecified" && entry.sleepStages != "In Bed"
        }
        let totalDuration = filteredEntries.reduce(0) { $0 + $1.duration }
        
        return totalDuration
    }
    
    static func calculateUnspecified(sleepData: [SleepEntry],selectedDay: Date) -> Double{
        let filteredEntriesUnspecified = sleepData.filter { entry in
            entry.startDate >= SleepFilteringFunc.startOfOpeningHours(selectedDate: selectedDay) && entry.endDate <= SleepFilteringFunc.endOfOpeningHours(selectedDate: selectedDay) && entry.sleepStages == "Unspecified"
        }
        let totalUnspecifiedDuration = filteredEntriesUnspecified.reduce(0) { $0 + $1.duration }
        
        return totalUnspecifiedDuration
    }
}


