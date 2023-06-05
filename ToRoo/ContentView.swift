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

//    @Environment(\.managedObjectContext) private var viewContext
//
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
    
    var body: some View {
        TimeBarChartView()
        SleepSummaryView()
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
