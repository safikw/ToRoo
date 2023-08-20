//
//  ToRooApp.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 30/05/23.
//

import SwiftUI

@main
struct ToRooApp: App {
//    let persistenceController = PersistenceController.shared
    @AppStorage("isFirstOpenApp") var isFirstOpenApp: Bool = true
    @StateObject var sleep: SleepManager = SleepManager()
    @StateObject var weekStore: WeekStore = WeekStore()
    
    
    func onCompleteOnBoarding() {
        isFirstOpenApp = false
    }

    var body: some Scene {
        WindowGroup {
//            if isFirstOpenApp {
//            VStack{
//                OnboardingView(onComplete: onCompleteOnBoarding)
//                    .onAppear {
//                        sleep.fetchSleepAnalysis(startDate: Calendar.current.startOfDay(for: Date()), endDate: Date())
//                    }
//            }
//            .environmentObject(sleep)
            
            HomeView(healthStore: sleep, weekStore: weekStore)
                .environmentObject(weekStore)
//            } else {
//                ContentView()
//                .preferredColorScheme(.light)
//            }
           
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
