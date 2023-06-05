//
//  SleepSummary.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 03/06/23.
//

import SwiftUI


struct SleepSummary: View {
    
    private var healthStore: SleepStore?

    // initializer healthkit
    init() {
        healthStore = SleepStore()
    }
    
    
    var body: some View {
        Text("Select an item")
    
    //request access healthStore
    .onAppear() {
        if let healthStore = healthStore {
            healthStore.requestAuthorization{
                success in
                //update UI Here
                
            }
        }
    }

    }
}

struct SleepSummary_Previews: PreviewProvider {
    static var previews: some View {
        SleepSummary()
    }
}
