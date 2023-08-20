import Foundation

struct SleepFiltering {
    private let calendar = Calendar.current
    
     func startOfOpeningHours(selectedDate: Date) -> Date {
         let calendar = Calendar.current
             var components = calendar.dateComponents([.year, .month, .day], from: selectedDate)
             components.hour = 23
             components.minute = 1
             components.second = 0
             return calendar.date(from: components)!
    }
    
     func endOfOpeningHours(selectedDate: Date) -> Date {
        var components = DateComponents()
        components.hour = 23
        components.minute = 0
        return calendar.date(byAdding: components, to: startOfOpeningHours(selectedDate: selectedDate+1))!
    }
    
    func filteringSleepStages(sleepData: [SleepEntry],selectedDay: Date, sleepStage: String) -> [SleepEntry] {
        let filteredEntries = sleepData.filter { entry in
            entry.startDate >= startOfOpeningHours(selectedDate: selectedDay) && entry.endDate <= endOfOpeningHours(selectedDate: selectedDay) && entry.sleepStages == sleepStage
        }
        
        return filteredEntries
        
    }
    
    func calculateDuration(sleepData: [SleepEntry], selectedDay: Date, sleepStage: String) -> Double {
        
        let filteredEntries = filteringSleepStages(sleepData: sleepData, selectedDay: selectedDay, sleepStage: sleepStage)
        
        let totalDuration = filteredEntries.reduce(0) { $0 + $1.duration }
        
        return totalDuration
    }
    
}
