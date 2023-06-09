//
//  SleepSummary.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 03/06/23.
//

import SwiftUI
import HealthKit


struct SleepSummaryView: View {
    
    @ObservedObject var healthStore: SleepStore
    @ObservedObject var weekStore: WeekStore
    
    
    var body: some View {
        VStack{
            TimeBarChartView(healthStore: healthStore, weekStore: weekStore)
            List(healthStore.sleepData) { sleep in
                VStack(alignment: .leading) {
                    Text("Start: \(healthStore.formatDate(sleep.startDate))")
                    Text("End: \(healthStore.formatDate(sleep.endDate))")
                    Text("Duration: \(healthStore.formatDuration(sleep.duration))")
                    Text("Sleep Stages:\(sleep.sleepStages)")
                    
                }
            }
            //request access healthStore
            .onAppear() {
                healthStore.requestAuthorization()
            }
        }

        
    }
    
    
}



//struct SleepSummary_Previews: PreviewProvider {
//    static var previews: some View {
//        SleepSummaryView()
//    }
//}
