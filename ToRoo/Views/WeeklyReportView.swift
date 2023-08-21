//
//  WeeklyReportView.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 10/06/23.
//

import SwiftUI

struct WeeklyReportView: View {
    @EnvironmentObject var healthStore: SleepManager
    @EnvironmentObject var weekStore: WeekStore
    var sleepFilter = SleepFiltering()
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Weekly Zzz Report" )
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
                        Text(sleepFilter.formattedTotalWeekDuration(
                            sleepData: healthStore.sleepData,
                            startOfWeek: weekStore.weeks[1].dates[0],
                            endOfWeek: weekStore.weeks[2].dates[0]))
                        
                            .font(.sfRoundedBold(fontSize: 32))
                        Text("on average this week")
                            .font(.sfRoundedRegular(fontSize: 12))
                        Text("\(weekStore.weeks[0].dates[0].formattedAsDayMonthYear()) - \(weekStore.weeks[0].dates[6].formattedAsDayMonthYear())")
                            .font(.sfRoundedRegular(fontSize: 12))
                        
                    }.foregroundColor(.black)
                }
                
                ZStack{
                    Circle()
                        .frame(width: 180)
                        .foregroundColor(Color.gray.opacity(0.2))
                    Circle()
                        .frame(width: 150)
                        .foregroundColor(Color.white)
                    VStack{
                        Image("7")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70)
                            .font(.sfRoundedBold(fontSize: 16))
                    }.foregroundColor(.black)
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
