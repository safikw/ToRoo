//
//  WeekView.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 06/06/23.
//

import SwiftUI

struct WeekView: View {
    @EnvironmentObject var weekStore: WeekStore
    @StateObject var healthStore: SleepManager
    
    var week: Week
    
    var body: some View {
        LazyHStack {
            ForEach(0..<7) { i in
                VStack {
                    Text(week.dates[i].toString(format: "E").uppercased().prefix(1))
                        .font(.sfRoundedSemiBold(fontSize: 16))
                        .padding([.top, .bottom], 10)
                        .foregroundColor(week.dates[i] == week.referenceDate ?  .white : Color("PrimaryColor") )
                    Spacer()
                        .frame(height: 4)
                    ZStack {
                        Text(week.dates[i].toString(format: "d"))
                            .font(.sfRoundedRegular(fontSize: 16))
                            .monospaced()
                            .foregroundColor(week.dates[i] == week.referenceDate ? .white : Color("PrimaryColor"))
                    }
                    ZStack{
                        Circle()
                            .size(width: 52, height: 55)
                            .padding(.top, -4)
                            .foregroundColor(week.dates[i] == week.referenceDate ? Color("SecondaryColor") : .white)
                        
                        
                        
//                        if healthStore.isSleepDataFetched && Date() < Date(timeIntervalSinceNow: 86400) {
                        Image(CharacterStateViewModel(selectedDay: week.dates[i], sleepStage: SleepStages.InBedStage.rawValue, sleepData: healthStore.sleepData).imageState())
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40)
                            
//                        }
                    }
                }
                .background(week.dates[i] == week.referenceDate ? Color("PrimaryColor") : Color("SecondaryColor"))
                .frame(height: 110)
                .cornerRadius(10)
                .shadow(radius: 5)
                .onTapGesture {
                    weekStore.selectedDate = week.dates[i]
                    print(weekStore.selectedDate)
                }
                .frame(maxWidth: .infinity)
                .onAppear{
//                    print(week, "Weeek")
                    healthStore.fetchSleepAnalysis(startDate: weekStore.weeks[1].dates.first!, endDate: weekStore.weeks[1].dates.last!)
                    
                    
                    print(weekStore.weeks[1].dates.first!,weekStore.weeks[1].dates.last! )
                    
                }
                
            }
        }
    }
}


