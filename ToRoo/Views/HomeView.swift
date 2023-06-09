//
//  HomeView.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 09/06/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var healthStore: SleepStore
    @ObservedObject var weekStore: WeekStore
    
    @State private var customAlertInfo = false
    
    @State private var isPanelVisible = false
    
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Image(systemName: "info.circle")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 24, height: 25)
                        .padding(.trailing)
                }
                
                Text("8 May 2023")
                    .foregroundColor(.white)
                    .font(.system(.largeTitle, design: .rounded, weight: .bold))

            ZStack {
                Circle()
                    .frame(width: 440)
                    .opacity(0.1)
                    .foregroundColor(.white)
                Circle()
                    .frame(width: 360)
                    .opacity(0.2)
                    .foregroundColor(.white)
                Circle()
                    .frame(width: 280)
                    .opacity(0.4)
                    .foregroundColor(.white)
                Image("toroChar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
            }

                Text("Someone had a blissful slumber while the rest of us were working overtime. Living the dream!")
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 298, height: 107)
                    .background(Rectangle().fill(Color.white).cornerRadius(12).opacity(0.7))
                
                NavigationLink{
                    SleepSummaryView(healthStore: healthStore, weekStore: weekStore)
                }label: {
                    Text("Sleep Summary Screen")
                }
                Spacer()
            }
            .background(Color("CalendarHover"))
            .ignoresSafeArea()
        }

    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
