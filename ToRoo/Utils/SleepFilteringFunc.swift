//
//  SleepFilteringFunc.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 11/06/23.
//

import Foundation



//TODO: FIX This Query
struct SleepFilteringFunc {
//    var selectedDay: Date

      func startOfOpeningHours(selectedDate: Date) -> Date{
        let dayChart = selectedDate.toString(format: "dd")
        let monthChart = selectedDate.toString(format: "MM")
        let yearChart = selectedDate.toString(format: "yyyy")
        let startTime = date(year: Int(yearChart)!, month: Int(monthChart)!, day: Int(dayChart)!, hour: 00, minutes: 00)
        
        return startTime
    }
    
      func endOfOpeningHours(selectedDate: Date) -> Date {
        let dayChart = selectedDate.toString(format: "dd")
        let monthChart = selectedDate.toString(format: "MM")
        let yearChart = selectedDate.toString(format: "yyyy")
        let endTime = date(year: Int(yearChart)!, month: Int(monthChart)!, day: Int(dayChart)!, hour: 23, minutes: 59)
        
        return endTime
    }
    
      func calculateInBed(sleepData: [SleepEntry],selectedDay: Date) -> Double {
        let filteredEntriesInBed = sleepData.filter { entry in
            entry.startDate >= SleepFilteringFunc.startOfOpeningHours(selectedDate: selectedDay) && entry.endDate <= SleepFilteringFunc.endOfOpeningHours(selectedDate: selectedDay) && entry.sleepStages == "In Bed"
        }
        let totalInBedDuration = filteredEntriesInBed.reduce(0) { $0 + $1.duration }
        
        return totalInBedDuration
    }
    
      func calculateTotal(sleepData: [SleepEntry],selectedDay: Date) -> Double{
        let filteredEntries = sleepData.filter { entry in
            entry.startDate >= SleepFilteringFunc.startOfOpeningHours(selectedDate: selectedDay) && entry.endDate <= SleepFilteringFunc.endOfOpeningHours(selectedDate: selectedDay) && entry.sleepStages != "Unspecified" && entry.sleepStages != "In Bed"
        }
        let totalDuration = filteredEntries.reduce(0) { $0 + $1.duration }
        
        return totalDuration
    }
    
      func calculateUnspecified(sleepData: [SleepEntry],selectedDay: Date) -> Double{
        let filteredEntriesUnspecified = sleepData.filter { entry in
            entry.startDate >= SleepFilteringFunc.startOfOpeningHours(selectedDate: selectedDay) && entry.endDate <= SleepFilteringFunc.endOfOpeningHours(selectedDate: selectedDay) && entry.sleepStages == "Unspecified"
        }
        let totalUnspecifiedDuration = filteredEntriesUnspecified.reduce(0) { $0 + $1.duration }
        
        return totalUnspecifiedDuration
    }
    
      func calculateTotalWeekDuration(sleepData: [SleepEntry]) -> String {
        var totalDuration: TimeInterval = 0
        let filteredEntries = sleepData.filter { entry in
            entry.startDate >= getStartsOfWeek()! && entry.endDate <= getEndsOfWeek()! && entry.sleepStages != "Unspecified" && entry.sleepStages != "In Bed"
        }
        let filteredEntriesInBed = sleepData.filter { entry in
            entry.startDate >= getStartsOfPreviousPreviousWeek()! && entry.endDate <= getEndsOfPreviousPreviousWeek()! && entry.sleepStages == "In Bed"
        }
        
        if filteredEntries.isEmpty {
            totalDuration = filteredEntriesInBed.reduce(0) { $0 + $1.duration } / 7
        }else{
            totalDuration = filteredEntries.reduce(0) { $0 + $1.duration } / 7
        }
//        let totalDuration = filteredEntries.reduce(0) { $0 + $1.duration } / 7
        //formatter hour
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated

        let formattedTotalDuration = formatter.string(from: TimeInterval(totalDuration))!
        
        return formattedTotalDuration
    }
    
      func calculateComparationTotalWeekDuration(sleepData: [SleepEntry]) -> String {
        var totalDuration: TimeInterval = 0
        let filteredEntries = sleepData.filter { entry in
            entry.startDate >= getStartsOfPreviousPreviousWeek()! && entry.endDate <= getEndsOfPreviousPreviousWeek()! && entry.sleepStages == "Unspecified"
        }
        
        let filteredEntriesInBed = sleepData.filter { entry in
            entry.startDate >= getStartsOfPreviousPreviousWeek()! && entry.endDate <= getEndsOfPreviousPreviousWeek()! && entry.sleepStages == "In Bed"
        }
        
        if filteredEntries.isEmpty {
            totalDuration = filteredEntriesInBed.reduce(0) { $0 + $1.duration }
        }else{
            totalDuration = filteredEntries.reduce(0) { $0 + $1.duration }
        }
        
        //formatter hour
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated

        let formattedTotalDuration = formatter.string(from: TimeInterval(totalDuration))!
        
        return formattedTotalDuration
    }
    
    
      func getStartsOfWeek()-> (Date)?{
            let calendar = Calendar.current
            let currentDate = Date()
            
            guard let startOfWeek = calendar.date(byAdding: .weekOfYear, value: -1, to: currentDate),
                  let startOfPreviousWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: startOfWeek))
            else {
                return nil
            }
            
            return startOfPreviousWeek
        }
    
      func getStartsOfPreviousPreviousWeek()-> (Date)?{
            let calendar = Calendar.current
            let currentDate = Date()
            
            guard let startOfWeek = calendar.date(byAdding: .weekOfYear, value: -2, to: currentDate),
                  let startOfPreviousWeek = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: startOfWeek))
            else {
                return nil
            }
            
            return startOfPreviousWeek
        }
    
      func getEndsOfPreviousPreviousWeek()-> (Date)?{
            let calendar = Calendar.current
            
        guard let endOfPreviousWeek = calendar.date(byAdding: .day, value: +7, to: getStartsOfPreviousPreviousWeek() ?? Date()) else {
            return nil
        }
            
            return endOfPreviousWeek
        }
    
      func getEndsOfWeek()-> (Date)?{
            let calendar = Calendar.current
            
        guard let endOfPreviousWeek = calendar.date(byAdding: .day, value: +7, to: getStartsOfWeek() ?? Date()) else {
            return nil
        }
            
            return endOfPreviousWeek
        }
    
    
      func rangeStartsWeekFormatter() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"

        let startsOfWeekString = formatter.string(from: getStartsOfWeek()!)

        return startsOfWeekString
        
    }
    
      func rangeEndsWeekFormatter() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy"
        let endsOfWeekString = formatter.string(from: getEndsOfWeek()!)

        return endsOfWeekString
        
    }
}


