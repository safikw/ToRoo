import Foundation

struct SleepFiltering {
    private let calendar = Calendar.current
    
//     func startOfOpeningHours(selectedDate: Date) -> Date {
//         let calendar = Calendar.current
//             var components = calendar.dateComponents([.year, .month, .day], from: selectedDate)
//             components.hour = 00
//             components.minute = 1
//             components.second = 0
//             return calendar.date(from: components)!
//    }
//
//     func endOfOpeningHours(selectedDate: Date) -> Date {
//        var components = DateComponents()
//        components.hour = 23
//        components.minute = 0
//        return calendar.date(byAdding: components, to: startOfOpeningHours(selectedDate: selectedDate))!
//    }
    
    
    //        let filteredInBed = filteredData.filter { entry in
    //            entry.startDate >= startOfOpeningHours && entry.endDate <= endOfOpeningHours && entry.sleepStages == "In Bed"
    //        }
    //
    //        let filteredREM = filteredData.filter { entry in
    //            entry.startDate >= startOfOpeningHours && entry.endDate <= endOfOpeningHours && entry.sleepStages == "REM"
    //        }
    //
    //        let filteredAwake = filteredData.filter { entry in
    //            entry.startDate >= startOfOpeningHours && entry.endDate <= endOfOpeningHours && entry.sleepStages == "Awake"
    //        }

    //        let totalUnspecified = filteredUnspecified.reduce(0) { $0 + $1.duration }/60
    //        let totalInBed = filteredInBed.reduce(0) { $0 + $1.duration }/60
    //        let totalREM = (filteredREM.reduce(0) { $0 + $1.duration })/60
    //        let totalAwake = (filteredAwake.reduce(0) { $0 + $1.duration })/60
    //
    //        let sleepEfficiency = ((totalInBed  -  totalREM - totalAwake )/480)*100
    
    
    func calculateTotalSleepEfficiency(sleepData: [SleepEntry], selectedDay: Date, startOfOpeningHours: Date, endOfOpeningHours: Date) -> Double {
        let totalInBed = calculateDuration(sleepData: sleepData, selectedDay: selectedDay, sleepStage: SleepStages.InBedStage.rawValue, startOfOpeningHours: startOfOpeningHours, endOfOpeningHours: endOfOpeningHours)


        let totalREM = calculateDuration(sleepData: sleepData, selectedDay: selectedDay, sleepStage: SleepStages.REMStage.rawValue, startOfOpeningHours: startOfOpeningHours, endOfOpeningHours: endOfOpeningHours)
        
        let totalAwake = calculateDuration(sleepData: sleepData, selectedDay: selectedDay, sleepStage: SleepStages.AwakeStage.rawValue, startOfOpeningHours: startOfOpeningHours, endOfOpeningHours: endOfOpeningHours)
        
        let sleepEfficiency = ((totalInBed  -  totalREM - totalAwake)/480)*100
        
        return sleepEfficiency
    }
    
    
    func filteringSleepStages(sleepData: [SleepEntry],selectedDay: Date, sleepStage: String, startOfOpeningHours: Date, endOfOpeningHours: Date) -> [SleepEntry] {
        let filteredEntries = sleepData.filter { entry in
            entry.startDate >= startOfOpeningHours && entry.endDate <= endOfOpeningHours && entry.sleepStages == sleepStage
        }
        
        return filteredEntries
        
    }
    
    func calculateDuration(sleepData: [SleepEntry], selectedDay: Date, sleepStage: String,startOfOpeningHours: Date, endOfOpeningHours: Date) -> Double {
        
        let filteredEntries = filteringSleepStages(sleepData: sleepData, selectedDay: selectedDay, sleepStage: sleepStage, startOfOpeningHours: startOfOpeningHours, endOfOpeningHours: endOfOpeningHours)
        
        
        
        let totalDuration = filteredEntries.reduce(0) { $0 + $1.duration }
        
        return totalDuration
    }
    
}
