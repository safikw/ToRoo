//
//  SleepSummary.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 03/06/23.
//

import SwiftUI
import HealthKit


struct SleepSummaryView: View {
    
    @EnvironmentObject var healthStore: SleepManager
    @EnvironmentObject var weekStore: WeekStore
    
    
    var body: some View {
        
        ScrollView(.vertical){
            VStack(alignment: .leading){
                //MARK: INFINITE DATE
                VStack {
                    WeekHeaderView()
                    WeeksTabView() { week in
                        WeekView( week: week)
                    }
                }//: INFINITE DATE
                
                //MARK: CHART
                VStack {
                    TimeBarChartView(healthStore: healthStore, selectedDay: weekStore.selectedDate, sleepData: healthStore.sleepData)
                        
                        .padding()
                }
                .frame(maxWidth: .infinity)
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
                
                OneDimensionalBarChartView(healthStore: healthStore, weekStore: weekStore,  data: [], selectedDay: weekStore.selectedDate)
                
                SleepEfficiency()
                                    .padding(.top, 20)
                WeeklyReportView()
            }
            .padding([.leading,.trailing], 10)
        }
        
        
    }
    
    
}





//struct SleepSummary_Previews: PreviewProvider {
//    static var previews: some View {
//        SleepSummaryView(healthStore: SleepStore(), weekStore: WeekStore())
//    }
//}
