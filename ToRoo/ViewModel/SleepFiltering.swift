import Foundation

struct SleepFiltering {
    private let calendar = Calendar.current
    
     private func startOfOpeningHours(selectedDate: Date) -> Date {
        return calendar.startOfDay(for: selectedDate)
    }
    
     private func endOfOpeningHours(selectedDate: Date) -> Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return calendar.date(byAdding: components, to: startOfOpeningHours(selectedDate: selectedDate))!
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
