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
        
        
        
        ScrollView(.vertical){
            VStack(spacing: 20){
                InfiniteWeekView()
                    .environmentObject(weekStore)
//                List(healthStore.sleepData) { sleep in
//                    VStack(alignment: .leading) {
//                        Text("Start: \(healthStore.formatDate(sleep.startDate))")
//                        Text("End: \(healthStore.formatDate(sleep.endDate))")
//                        Text("Duration: \(healthStore.formatDuration(sleep.duration))")
//                        Text("Sleep Stages:\(sleep.sleepStages)")
//
//                    }
//                }.frame(height: 100)
                
                
                TimeBarChartView(healthStore: healthStore, weekStore: weekStore)
                OneDimensionalBarChartView(healthStore: healthStore, weekStore: weekStore, data: [])
                
                
                
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
