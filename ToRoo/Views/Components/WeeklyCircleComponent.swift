//
//  WeeklyCircleComponent.swift
//  SleepWithToRoo
//
//  Created by Safik Widiantoro on 21/08/23.
//

import SwiftUI

struct WeeklyCircleComponent: View {
    var totalDuration: String
    var totalThisWeekDuration: Double
    var totalPreviousWeekDuration: Double
    var startDate: String
    var endDate: String
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 180)
                .foregroundColor(Color.gray.opacity(0.2))
            Circle()
                .frame(width: 150)
                .foregroundColor(Color.white)
            
            VStack{
                Text(totalDuration)
        
                .font(.sfRoundedBold(fontSize: 32))
            Text("on average this week")
                .font(.sfRoundedRegular(fontSize: 12))
            Text("\(startDate) - \(endDate)")
                .font(.sfRoundedRegular(fontSize: 12))
                .foregroundColor(.black)
        }.foregroundColor(totalThisWeekDuration < totalPreviousWeekDuration ? .red : .green)
    }//: ZStack
    }
}

//struct WeeklyCircleComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        WeeklyCircleComponent()
//    }
//}
