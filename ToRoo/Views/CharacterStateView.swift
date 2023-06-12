//
//  CharacterStateView.swift
//  ToRoo
//
//  Created by Adry Mirza on 12/06/23.
//

import SwiftUI

struct CharacterStateView {
    @ObservedObject var healthStore: SleepStore
    @EnvironmentObject var weekStore: WeekStore
    var selectedDay: Date
    var sleepData: [SleepEntry]
    
    init(healthStore: SleepStore, weekStore: WeekStore, selectedDay: Date, sleepData: [SleepEntry]) {
        self.healthStore = healthStore
        self.selectedDay = selectedDay
        self.sleepData = healthStore.sleepData
    }
    
    func imageState() -> String{
        let totalInBed = SleepFilteringFunc.calculateInBed(sleepData: sleepData, selectedDay: selectedDay)
        var imageName: String
        switch totalInBed/3600{
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
