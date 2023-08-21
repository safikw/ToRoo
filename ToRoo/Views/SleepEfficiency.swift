//
//  SleepEfficiency.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 10/06/23.
//

import SwiftUI

struct SleepEfficiency: View {
    @State private var showingPopover = false
    @StateObject var healthStore: SleepManager
    @EnvironmentObject var weekStore: WeekStore
    var sleepFilter = SleepFiltering()






    var body: some View {


        VStack(alignment: .leading){
            Text("Sleep Eficiency: ")
                .font(.system(size: 16))
            HStack(alignment: .top){
                //TODO: Sleep Efficiency
                Text("\(String(format: "%.2f", sleepFilter.calculateTotalSleepEfficiency(sleepData: healthStore.sleepData, selectedDay: Date(), startOfOpeningHours: Date().startOfDay, endOfOpeningHours: Date().endOfDay)))%")
                    .font(.system(size: 32))
                    .foregroundColor(Color("PrimaryColor"))
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                Button() {
                    showingPopover.toggle()
                }label: {
                    Image(systemName: "info.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16)
                }
//                .iOSPopover(isPresented: $showingPopover, arrowDirection: .up){
//                    ScrollViewReader { value in
//                        ScrollView{
//                            Text("""
//                The amount of time you spend actually sleeping while in bed is known as sleep  efficiency. This measurement should ideally be 85 percent or more for optimal health benefits\n(National Sleep Foundation, thensf.org).
//                """)
//                            .padding()
//                        }.frame(height: 155)
//                            .shadow(radius: 25)
//                    }
//                }
            }
        }

    }
}

//struct SleepEfficiency_Previews: PreviewProvider {
//    static var previews: some View {
//        SleepEfficiency()
//    }
//}
