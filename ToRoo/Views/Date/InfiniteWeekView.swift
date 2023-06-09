//
//  InfiniteWeekView.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 06/06/23.
//

import SwiftUI

struct InfiniteWeekView: View {
    @EnvironmentObject var weekStore: WeekStore

//    @State var tasks: [Task] = MockTasks().all()

    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    VStack {
                        WeekHeaderView()
                        WeeksTabView() { week in
                            WeekView(week: week)
                        }.frame(height: 150)
                    }
                }
            }
        }
    }
}

//struct InfiniteWeekView_Previews: PreviewProvider {
//    static var previews: some View {
//        InfiniteWeekView()
//    }
//}
