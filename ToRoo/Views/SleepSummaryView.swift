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
            VStack(alignment: .leading){
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
                
                Text("Sleep Eficiency: 85%")
                    .font(.system(size: 24))
                    .foregroundColor(Color("CalendarHover"))
                
                Text("""
                    The amount of time you spend actually sleeping while in bed is known as sleep efficiency. This measurement should ideally be 85 percent or more for optimal health benefits (National Sleep Foundation, thensf.org).
                    """)
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
                
                Text("Weekly Zzz Report")
                    .font(.system(size: 24))
                    .foregroundColor(Color("CalendarHover"))
                Text(
                """
                Behold, your Weekly Zzz Report is revealed! It's the golden nugget that unveils your typical time spent in dreamland. Armed with this knowledge, you'll conquer the freelance realm with vigor and vitality.
                """
                )
                Text("Your average sleep hour is:")
                    .foregroundColor(Color("CalendarHover"))
                Text("2.6hr")
                Text("4 - 11 May 2023")
                
                
                
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
