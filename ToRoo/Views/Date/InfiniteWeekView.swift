//
//  InfiniteWeekView.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 06/06/23.
//

import SwiftUI

struct InfiniteWeekView: View {
    @EnvironmentObject var weekStore: WeekStore
    @EnvironmentObject var healthStore: Sleep

//    @State var tasks: [Task] = MockTasks().all()

    var body: some View {
                        VStack {
                            WeekHeaderView()
                            WeeksTabView() { week in
                                WeekView(week: week).environmentObject(healthStore)
                            }
                        }
        
        
    }
}

//struct InfiniteWeekView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfiniteWeekView()
//    }
//}
