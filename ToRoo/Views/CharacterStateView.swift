//
//  CharacterStateView.swift
//  ToRoo
//
//  Created by Adry Mirza on 12/06/23.
//

import SwiftUI

struct CharacterStateView {
    @EnvironmentObject var healthStore: Sleep
    @EnvironmentObject var weekStore: WeekStore
    
    var selectedDay: Date
    var sleepData: [SleepEntry]
    
    init(healthStore: Sleep, weekStore: WeekStore, selectedDay: Date, sleepData: [SleepEntry]) {
//        self.healthStore = healthStore
        self.selectedDay = selectedDay
        self.sleepData = healthStore.sleepData
    }
    
    func imageState() -> String{
//        let totalInBed = SleepFilteringFunc.calculateInBed(sleepData: sleepData, selectedDay: selectedDay)
//
////        let totalInBed1 = sleepData.
        
        let totalUnspecifiedDuration = sleepData.reduce(0) { $0 + $1.duration }
        print(totalUnspecifiedDuration)
        print(sleepData)
        var imageName: String
        switch totalUnspecifiedDuration/3600{
        case 0:
            imageName = "0"
        case ...1:
            imageName = "1"
        case ...2:
            imageName = "2"
        case ...3:
            imageName = "3"
        case ...4:
            imageName = "4"
        case ...5:
            imageName = "5"
        case ...6:
            imageName = "6"
        case ...7:
            imageName = "7"
        default:
            imageName = "7"
        }
        return imageName
    }
}
