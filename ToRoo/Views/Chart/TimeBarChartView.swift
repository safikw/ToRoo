//
//  TimeBarChartView.swift
//  ToRoo
//
//  Created by Adry Mirza on 05/06/23.
//

import SwiftUI
import Charts

struct TimeBarChartView: View {
    @StateObject var healthStore: Sleep
    @EnvironmentObject var weekStore: WeekStore
    @State var isSheetPresented = false
    var selectedDay: Date
    var sleepData: [SleepEntry]
    let sleepFilter = SleepFiltering()
    
    var body: some View {
        
        if healthStore.sleepData.isEmpty {
            Text("No Sleep Data today")
                .font(.system(size: 18))
        } else {
            VStack(alignment: .leading, spacing: -20){
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("TIME ASLEEP")
                            .font(.sfRoundedRegular(fontSize: 16))
                        
                        Text("Halppp")
                            .font(.sfRoundedBold(fontSize: 32))
                            .foregroundColor(Color("PrimaryColor"))
                        
                    }
                    
                    Spacer()
                    
                    Image(systemName: "info.circle")
                        .resizable()
                        .foregroundColor(.blue)
                        .frame(width: 22, height: 22)
                        .padding(.trailing, 8)
                        .onTapGesture {
                            withAnimation(.easeOut) {
                                isSheetPresented.toggle()
                            }
                        }.sheet(isPresented: $isSheetPresented) {
                            SleepStageSheetView()
                        }
                }
                EventChart(events: healthStore.sleepData ,
                           chartXScaleRangeStart: weekStore.selectedDate.startOfDay,
                           chartXScaleRangeEnd: weekStore.selectedDate.endOfDay)
            }
            
        }
        
    }
    
    
    //           static func getEventsTotalDuration(_ events: [SleepEntry]) -> String {
    //                    var durationInSeconds: TimeInterval = 0
    //                    for event in events {
    //                        durationInSeconds += event.startDate.distance(to: event.endDate)
    //                    }
    //                    return getFormattedDuration(seconds: durationInSeconds)
    //                }
    
    //               tatic func getFormattedDuration(seconds: Double) -> String {
    //                    let formatter = DateComponentsFormatter()
    //                    formatter.unitsStyle = .abbreviated
    //                    formatter.zeroFormattingBehavior = .pad
    //                    formatter.allowedUnits = [.hour, .minute]
    //
    //                    return formatter.string(from: seconds) ?? "N/A"
    //                }
    
}




//struct TimeBarChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimeBarChartView(healthStore: SleepStore(), weekStore: WeekStore(), selectedDay: Date(), sleepData: [])
//    }s
//}







