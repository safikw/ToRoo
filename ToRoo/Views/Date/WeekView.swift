//
//  WeekView.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 06/06/23.
//

import SwiftUI

struct WeekView: View {
    @EnvironmentObject var weekStore: WeekStore

    var week: Week

    var body: some View {
        HStack {
            ForEach(0..<7) { i in
                    VStack {
                        Text(week.dates[i].toString(format: "E").uppercased().prefix(1))
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .padding([.top, .bottom], 10)
                            .foregroundColor(week.dates[i] == week.referenceDate ?  .white : Color("CalendarHover") )
                        Spacer()
                            .frame(height: 4)
                        ZStack {
                            Text(week.dates[i].toString(format: "d"))
                                .font(.system(size: 16))
                                .monospaced()
//                                .frame(maxWidth: .infinity)
                                .foregroundColor(week.dates[i] == week.referenceDate ? .white : Color("CalendarHover"))
                        }
                        ZStack{
                            Circle()
                                .size(width: 52, height: 55)
                                .padding(.top, -4)
                                .foregroundColor(week.dates[i] == week.referenceDate ? Color("Calendar") : .white)
                            Image("toroChar")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40)
                        }
                        
                    
                    }
                    .background(week.dates[i] == week.referenceDate ? Color("CalendarHover") : Color("Calendar"))
                    .frame(height: 110)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .onTapGesture {
                            weekStore.selectedDate = week.dates[i]
                        
                    }
                    .frame(maxWidth: .infinity)
                
                
                    

            }
        }
    }
}

//struct WeekView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeekView(week: .init(index: 1, dates:
//                                [
//                                    Date().yesterday.yesterday.yesterday,
//                                    Date().yesterday.yesterday,
//                                    Date().yesterday,
//                                    Date(),
//                                    Date().tomorrow,
//                                    Date().tomorrow.tomorrow,
//                                    Date().tomorrow.tomorrow.tomorrow
//                                ],
//                             referenceDate: Date()))
//        .environmentObject(WeekStore())
//
//    }
//}
