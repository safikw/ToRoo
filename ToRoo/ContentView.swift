//
//  ContentView.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 30/05/23.
//

import SwiftUI
import CoreData
import HealthKit

struct ContentView: View {
    @StateObject var healthStore = SleepStore()
    @StateObject var weekStore: WeekStore = WeekStore()
    
    var body: some View {
       
        VStack{
            InfiniteWeekView()
                .environmentObject(weekStore)

            SleepSummaryView(healthStore: healthStore, weekStore: weekStore)
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
