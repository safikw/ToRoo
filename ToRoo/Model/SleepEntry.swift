//
//  SleepEntry.swift
//  SleepWithToRoo
//
//  Created by Safik Widiantoro on 16/08/23.
//

import Foundation

struct SleepEntry: Identifiable, Equatable{
    var id = UUID()
    let startDate: Date
    let endDate: Date
    let sleepStages: String
    let duration: TimeInterval
    
    init(id: UUID = UUID(), startDate: Date, endDate: Date, sleepStages: String, duration: TimeInterval) {
        self.id = id
        self.startDate = startDate
        self.endDate = endDate
        self.sleepStages = sleepStages
        self.duration = duration
    }
    
}
