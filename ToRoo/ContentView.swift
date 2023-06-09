//
//  ContentView.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 30/05/23.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    @StateObject var healthStore = SleepStore()
    @StateObject var weekStore: WeekStore = WeekStore()
    
    var body: some View {
        VStack{
            InfiniteWeekView()
                .environmentObject(weekStore)
            TimeBarChartView(healthStore: healthStore, weekStore: weekStore)
            OneDimensionalBarChartView(healthStore: healthStore, weekStore: weekStore, data: [])
            SleepSummaryView(healthStore: healthStore)
        }

        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
