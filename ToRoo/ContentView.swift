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

//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
    
    var body: some View {
        VStack{
            InfiniteWeekView()
                .environmentObject(weekStore)
            TimeBarChartView(healthStore: healthStore, weekStore: weekStore)
            SleepSummaryView(healthStore: healthStore)
        }
        
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
