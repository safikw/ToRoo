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
//        SleepSummaryView(healthStore: healthStore, weekStore: weekStore)
        HomeView(healthStore: healthStore, weekStore: weekStore).onAppear() {
            healthStore.requestAuthorization()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
