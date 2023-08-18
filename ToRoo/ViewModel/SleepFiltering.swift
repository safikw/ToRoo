import Foundation

struct SleepFilteringFunc {
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
    
    func calculateDuration(sleepData: [SleepEntry], selectedDay: Date, sleepStage: String) -> Double {

        let filteredEntriesInBed = sleepData.filter { entry in
                   entry.startDate >= startOfOpeningHours(selectedDate: selectedDay) && entry.endDate <= endOfOpeningHours(selectedDate: selectedDay) && entry.sleepStages == sleepStage
               }
               let totalInBedDuration = filteredEntriesInBed.reduce(0) { $0 + $1.duration }
               
               return totalInBedDuration
    }

}
