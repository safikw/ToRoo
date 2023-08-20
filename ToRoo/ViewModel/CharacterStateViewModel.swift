//
//  CharacterStateView.swift
//  ToRoo
//
//  Created by Adry Mirza on 12/06/23.
//

import SwiftUI

struct CharacterStateViewModel {
    
    var selectedDay: ClosedRange<Date>
    var sleepStage: String
    var sleepData: [SleepEntry]
    let sleepFilter = SleepFiltering()

    
    func imageState() -> String{
        let totalInBed = sleepFilter.calculateDuration(sleepData: sleepData, selectedDay: sleepFilter.startOfOpeningHours(selectedDate: <#T##Date#>), sleepStage: sleepStage)
//        print(totalInBed)
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
