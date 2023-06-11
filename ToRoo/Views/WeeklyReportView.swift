//
//  WeeklyReportView.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 10/06/23.
//

import SwiftUI

struct WeeklyReportView: View {
    var body: some View {
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
                    Text("2.6hr")
                        .font(.sfRoundedBold(fontSize: 48))
                        .foregroundColor(.red)
                    Text("on average this week")
                        .font(.sfRoundedRegular(fontSize: 12))
                        .foregroundColor(.red)
                    Text("4 - 11 May 2023")
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

struct WeeklyReportView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyReportView()
    }
}
