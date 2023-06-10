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
            VStack(){
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
                VStack{
                    TimeBarChartView(healthStore: healthStore, weekStore: weekStore)
                        .padding()
                }
                
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
                
                
                
                
                OneDimensionalBarChartView(healthStore: healthStore, weekStore: weekStore, data: [])
                
                
                
            }.padding()
            //request access healthStore
            .onAppear() {
                healthStore.requestAuthorization()
            }
        }.navigationBarBackButtonHidden(true)
        
    }
    
    
}



//struct SleepSummary_Previews: PreviewProvider {
//    static var previews: some View {
//        SleepSummaryView()
//    }
//}
