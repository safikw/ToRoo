//
//  WeeklyReportView.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 10/06/23.
//

import SwiftUI

struct WeeklyReportView: View {
    var body: some View {
        Text("Weekly Zzz Report")
            .font(.system(size: 24))
            .fontWeight(.bold)
            .foregroundColor(Color("PrimaryColor"))
        Text(
        """
        Behold, your Weekly Zzz Report is revealed! It's the golden nugget that unveils your typical time spent in dreamland. Armed with this knowledge, you'll conquer the freelance realm with vigor and vitality.
        """
        )
        Text("Your average sleep hour is:")
            .foregroundColor(Color("PrimaryColor"))
        HStack{
            ZStack{
                Circle()
                    .frame(width: 180)
                    .foregroundColor(Color.gray.opacity(0.2))
                VStack{
                    Text("2.6hr")
                    Text("4 - 11 May 2023")
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

struct WeeklyReportView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyReportView()
    }
}
