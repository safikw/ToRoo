//
//  SleepSummary.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 03/06/23.
//

import SwiftUI
import HealthKit


struct SleepSummaryView: View {
    @StateObject var healthStore = SleepStore()
    
    
    var body: some View {
        List(healthStore.sleepData) { sleep in
            VStack(alignment: .leading) {
                Text("Start: \(healthStore.formatDate(sleep.startDate))")
                Text("End: \(healthStore.formatDate(sleep.endDate))")
                Text("Duration: \(healthStore.formatDuration(sleep.duration))")
                switch sleep.sleepStages.rawValue {
                case 0:
                    Text("Sleep Stages: InBed")
                case 1:
                    Text("Sleep Stages: asleepUnspecified")
                case 2:
                    Text("Sleep Stages: awake")
                case 3:
                    Text("Sleep Stages: asleepCore")
                case 4:
                    Text("Sleep Stages: asleepDeep")
                case 5:
                    Text("Sleep Stages: asleepREM")
                default:
                    Text("Sleep Stages: asleepUnspecified")
                }
                
            }
        }  
        //request access healthStore
        .onAppear() {
            healthStore.requestAuthorization()
            
        }
        
    }
    
    
}



//struct SleepSummary_Previews: PreviewProvider {
//    static var previews: some View {
//        SleepSummaryView()
//    }
//}
