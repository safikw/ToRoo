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
    
    func onCompleteOnBoarding() {
        isFirstOpenApp = false
    }

    var body: some Scene {
        WindowGroup {
//            if isFirstOpenApp {
//                OnboardingView(onComplete: onCompleteOnBoarding)
//            } else {
                ContentView()
            }
           
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
//        }
    }
}
