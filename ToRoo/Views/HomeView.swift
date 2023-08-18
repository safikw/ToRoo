//
//  HomeView.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 09/06/23.
//

import SwiftUI
//import UserNotifications

struct HomeView: View {
    @StateObject var healthStore: Sleep
    @ObservedObject var weekStore: WeekStore
    
    @State private var sleepStages: SleepStages = .AwakeStage
    
    @State private var customAlertInfo = false
    
    @State private var isPanelVisible = false
    @State private var isDetailViewActive = false
    private var animation: Animation {
        .linear
        .speed(0.1)
        .repeatForever(autoreverses: true)
    }
    @State private var rotationDegrees = 0.0
    @State var isMoving = false
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Image(systemName: "info.circle")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    .offset(x: 150, y: 60)
                    .onTapGesture {
                        withAnimation(.easeOut) {
                            isPanelVisible.toggle()
                        }
                        
                    }
                
                ZStack {
                    Image("radial")
                        .resizable()
                        .scaledToFit()
                    
                    VStack{
                        Text("\(Date.getCurrentDate())")
                            .foregroundColor(.white)
                            .textCase(.uppercase)
                            .font(.sfRoundedBlack(fontSize: 32))
                            .padding(.bottom, 20)
                        Spacer().frame(minHeight: 10.0, idealHeight: 48.0, maxHeight: 48.0)
                        
                        Image(CharacterStateViewModel(selectedDay: Date(), sleepStage: SleepStages.InBedStage.rawValue, sleepData: healthStore.sleepData).imageState())
                            .resizable()
                            .scaledToFit()
                            .frame(width: 318, height: 219)
                            .shadow(radius: 25, y: 10)
                            .offset(y: isMoving ? -60: -50)
                            .onAppear{
                                withAnimation(animation){
                                    isMoving = true
                                }
                            }
                            .onAppear {
                                healthStore.fetchSleepAnalysis(startDate: Date().startOfDay, endDate: Date().endOfDay)
                            }
                    }
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
            //TODO: USER NOTIFICATION
            //            .onAppear() {
            //                notify.requestNotif()
            //                if SleepFilteringFunc.calculateTotal(sleepData: healthStore.sleepData, selectedDay: Date()) < 25200 {
            //                    notify.schedulerNotif( type: "date",  title: "Daily Toroo Reminder", body: "Your sleep means to me. Take care of me, please",notifHour: 12)
            //                } else {
            //                    notify.schedulerNotif( type: "date",  title: "Daily Toroo Reminder", body: "Congrats, you nailed the sleep and took care of me today!",notifHour: 12)
            //                }
            //
            //                notify.schedulerNotif(type: "date", title: "Daily Toroo Recap", body: "Stay informed with a friendly nudge from ToRoo as it provides a delightful recap of your sleep status from the previous day.", notifHour: 9)
            //                healthStore.requestAuthorization()
            //            }
            .background(LinearGradient(colors: [Color(hex: "#BFA0C7"), Color(hex: "#38177D")], startPoint: UnitPoint(x: 0.5, y: 0),
                                       endPoint: UnitPoint(x: 0.5, y: 1)))
            .ignoresSafeArea()
            .overlay (
                Group {
                    if isPanelVisible {
                        withAnimation(.easeInOut) {
                            PopUpViewInfo (isPanelVisible: $isPanelVisible)
                        }
                    }
                }
            )
        }
    }
}
//
//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView(healthStore: SleepStore(), weekStore: WeekStore())
//    }
//}
