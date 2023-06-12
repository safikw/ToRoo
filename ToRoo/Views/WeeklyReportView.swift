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
        let totalPreviousWeekDuration = SleepFilteringFunc.calculateComparationTotalWeekDuration(sleepData: healthStore.sleepData)
        
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
            .padding(.top, 20)
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
                        .font(.sfRoundedBold(fontSize: 32))
                    Text("on average this week")
                        .font(.sfRoundedRegular(fontSize: 12))
                    Text("\(startsOfWeek) - \(endsOfWeek)")
                        .font(.sfRoundedRegular(fontSize: 12))
                        .foregroundColor(.black)
                }.foregroundColor(totalWeekDuration < totalPreviousWeekDuration ? .red : .green)
            }
            
            ZStack{
                Circle()
                    .frame(width: 180)
                    .foregroundColor(Color.gray.opacity(0.2))
                Circle()
                    .frame(width: 150)
                    .foregroundColor(Color.white)
                VStack{
                    Image( totalWeekDuration < totalPreviousWeekDuration ? "8" : "7")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                    Text(totalWeekDuration < totalPreviousWeekDuration ? "decreased" : "increased")
                        .font(.sfRoundedMedium(fontSize: 12))
                    Text("compared to last week")
                        .font(.sfRoundedRegular(fontSize: 12))
                }.foregroundColor(totalWeekDuration < totalPreviousWeekDuration ? .red : .green)
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
