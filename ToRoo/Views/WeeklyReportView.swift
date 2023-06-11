//
//  WeeklyReportView.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 10/06/23.
//

import SwiftUI

struct WeeklyReportView: View {
    @ObservedObject var healthStore: SleepStore
    
    var body: some View {
        let totalWeekDuration = SleepFilteringFunc.calculateTotalWeekDuration(sleepData: healthStore.sleepData)
        let startsOfWeek = SleepFilteringFunc.rangeStartsWeekFormatter()
        let endsOfWeek = SleepFilteringFunc.rangeEndsWeekFormatter()
        
        VStack(alignment: .leading){
        Text("Weekly Zzz Report")
                .font(.sfRoundedBold(fontSize: 32))
            .fontWeight(.bold)
            .foregroundColor(Color("PrimaryColor"))
        Text(
        """
        Behold, your Weekly Zzz Report is revealed! It's the golden nugget that unveils your typical time spent in dreamland. Armed with this knowledge, you'll conquer the freelance realm with vigor and vitality.
        """
        )
        .font(.caption)
        Text("Your average sleep hour is:")
            .foregroundColor(Color("PrimaryColor"))
        HStack{
            ZStack{
                Circle()
                    .frame(width: 180)
                    .foregroundColor(Color.gray.opacity(0.2))
                Circle()
                    .frame(width: 150)
                    .foregroundColor(Color.white)
                VStack{
                    Text("\(totalWeekDuration)")
                        .font(.sfRoundedBold(fontSize: 36))
                        .foregroundColor(.red)
                    Text("on average this week")
                        .font(.sfRoundedRegular(fontSize: 12))
                        .foregroundColor(.red)
                    Text("\(startsOfWeek) - \(endsOfWeek)")
                        .font(.sfRoundedRegular(fontSize: 12))
                }
            }
            
            ZStack{
                Circle()
                    .frame(width: 180)
                    .foregroundColor(Color.gray.opacity(0.2))
                Circle()
                    .frame(width: 150)
                    .foregroundColor(Color.white)
                VStack{
                    Text("2.6hr")
                    Text("4 - 11 May 2023")
                }
            }
        }
        }
}
}

//struct WeeklyReportView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeeklyReportView(healthStore: healthStore)
//    }
//}
