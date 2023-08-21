import Foundation

struct SleepFiltering {
    private let calendar = Calendar.current
    
    
    
    private func filteringSleepStagesInWeek(sleepData: [SleepEntry],startOfWeek: Date, sleepStage: String, endOfWeek: Date) -> [SleepEntry] {
        let filteredEntries = sleepData.filter { entry in
            entry.startDate >= startOfWeek && entry.endDate <= endOfWeek && entry.sleepStages == sleepStage
        }
        
        return filteredEntries
        
    }
    
    func formattedTotalWeekDuration(sleepData: [SleepEntry], startOfWeek: Date, endOfWeek: Date) -> String{
        
        let totalWeekDuration = calculateTotalWeekDuration(sleepData: sleepData, startOfWeek: startOfWeek, endOfWeek: endOfWeek)
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        
        let formattedTotalDuration = formatter.string(from: TimeInterval(totalWeekDuration))!
        
        return formattedTotalDuration
    }
    
    
    private func filteringSleepStages(sleepData: [SleepEntry],selectedDay: Date, sleepStage: String, startOfOpeningHours: Date, endOfOpeningHours: Date) -> [SleepEntry] {
        let filteredEntries = sleepData.filter { entry in
            entry.startDate >= startOfOpeningHours && entry.endDate <= endOfOpeningHours && entry.sleepStages == sleepStage
        }
        
        return filteredEntries
        
    }
    
    func calculateTotalSleepEfficiency(sleepData: [SleepEntry], selectedDay: Date, startOfOpeningHours: Date, endOfOpeningHours: Date) -> Double {
        let totalInBed = calculateDuration(sleepData: sleepData, selectedDay: selectedDay, sleepStage: SleepStages.InBedStage.rawValue, startOfOpeningHours: startOfOpeningHours, endOfOpeningHours: endOfOpeningHours)
        
        
        let totalREM = calculateDuration(sleepData: sleepData, selectedDay: selectedDay, sleepStage: SleepStages.REMStage.rawValue, startOfOpeningHours: startOfOpeningHours, endOfOpeningHours: endOfOpeningHours)
        
        let totalAwake = calculateDuration(sleepData: sleepData, selectedDay: selectedDay, sleepStage: SleepStages.AwakeStage.rawValue, startOfOpeningHours: startOfOpeningHours, endOfOpeningHours: endOfOpeningHours)
        
        let sleepEfficiency = ((totalInBed  -  totalREM - totalAwake)/480)*100
        
        return sleepEfficiency
    }
    
    func calculateTotalWeekDuration(sleepData: [SleepEntry], startOfWeek: Date, endOfWeek: Date) -> Double {
        
        let filteredEntries = filteringSleepStagesInWeek(sleepData: sleepData, startOfWeek: startOfWeek, sleepStage: SleepStages.InBedStage.rawValue, endOfWeek: endOfWeek)
        
        let totalDuration = filteredEntries.reduce(0) { $0 + $1.duration } / 7
        
        return totalDuration
    }
    
    func calculateDuration(sleepData: [SleepEntry], selectedDay: Date, sleepStage: String,startOfOpeningHours: Date, endOfOpeningHours: Date) -> Double {
        
        let filteredEntries = filteringSleepStages(sleepData: sleepData, selectedDay: selectedDay, sleepStage: sleepStage, startOfOpeningHours: startOfOpeningHours, endOfOpeningHours: endOfOpeningHours)
        
        
        
        let totalDuration = filteredEntries.reduce(0) { $0 + $1.duration }
        
        return totalDuration
    }
    
    
}
