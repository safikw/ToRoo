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
    @State private var isDetailViewActive = false
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Image(systemName: "info.circle")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    .offset(x: 150, y: 60)
                
            ZStack {
                Image("radial").resizable().scaledToFit()
                VStack{
                    Text("\(weekStore.selectedDate.toString(format: "dd MMMM yyyy"))")
                        .foregroundColor(.white)
                        .textCase(.uppercase)
                        .font(.sfRoundedBlack(fontSize: 32))
                    Spacer().frame(minHeight: 10.0, idealHeight: 48.0, maxHeight: 48.0)
                    Image("toroChar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 318)
                        .shadow(radius: 25, y: 10)
                }.offset(y: -60)
            }.offset(y: 45)

                Text("Someone had a blissful slumber while the rest of us were working overtime. Living the dream!")
                    .font(.sfRoundedMedium(fontSize: 16))
                    .foregroundColor(Color(hex: "#35127A"))
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(width: 298, height: 107)
                    .background(Rectangle().fill(Color(hex: "#EADFEF")).cornerRadius(12))
                    .shadow(color:Color(uiColor: UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.15)) ,radius: 16, y: 4)
                    .offset(y: 65)
                
//                NavigationLink{
//                    SleepSummaryView(healthStore: healthStore, weekStore: weekStore)
//                }label: {
//                    Text("Sleep Summary Screen")
//                }.offset(y: 100)
                Spacer()
                ZStack{
                    Image("BAWAH")
                        .resizable()
                        .scaledToFit()
                    Text("Swipe up to go to the dashboard")
                        .font(.sfRoundedMedium(fontSize: 15))
                        .tracking(-0.5)
                        .foregroundColor(Color(hex: "#462781"))
                        .offset(y:15)
                }.gesture(
                    DragGesture()
                        .onEnded { gesture in
                            if gesture.translation.height < -100 {
                                self.isDetailViewActive = true
                            }
                        }
                )
                .background(
                    withAnimation(){
                        NavigationLink("Move to summary",isActive: $isDetailViewActive) {
                            SleepSummaryView(healthStore: healthStore, weekStore: weekStore)
                        }
                    }
                    
                )
                
            }
            .background(LinearGradient(colors: [Color(hex: "#BFA0C7"), Color(hex: "#38177D")], startPoint: UnitPoint(x: 0.5, y: 0),
                                       endPoint: UnitPoint(x: 0.5, y: 1)))
            .ignoresSafeArea()
        }
    }
}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(healthStore: SleepStore(), weekStore: WeekStore())
//    }
//}
