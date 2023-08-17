////
////  WeekView.swift
////  ToRoo
////
////  Created by Safik Widiantoro on 06/06/23.
////
//
//import SwiftUI
//
//struct WeekView: View {
//    @EnvironmentObject var weekStore: WeekStore
//    @EnvironmentObject var healthStore: Sleep
//
//    var week: Week
//
//    var body: some View {
//        LazyHStack {
//            ForEach(0..<7) { i in
//                    VStack {
//                        Text(week.dates[i].toString(format: "E").uppercased().prefix(1))
//                            .font(.sfRoundedSemiBold(fontSize: 16))
//                            .padding([.top, .bottom], 10)
//                            .foregroundColor(week.dates[i] == week.referenceDate ?  .white : Color("PrimaryColor") )
//                        Spacer()
//                            .frame(height: 4)
//                        ZStack {
//                            Text(week.dates[i].toString(format: "d"))
//                                .font(.sfRoundedRegular(fontSize: 16))
//                                .monospaced()
//                                .foregroundColor(week.dates[i] == week.referenceDate ? .white : Color("PrimaryColor"))
//                        }
//                        ZStack{
//                            Circle()
//                                .size(width: 52, height: 55)
//                                .padding(.top, -4)
//                                .foregroundColor(week.dates[i] == week.referenceDate ? Color("SecondaryColor") : .white)
//                            if( Date() < Date(timeIntervalSinceNow: 86400)){
//                                Image(CharacterStateView(healthStore: healthStore, weekStore: weekStore, selectedDay: week.dates[i], sleepData: healthStore.sleepData).imageState())
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 40)
//                            }
//                        }
//
//
//                    }
//                    .background(week.dates[i] == week.referenceDate ? Color("PrimaryColor") : Color("SecondaryColor"))
//                    .frame(height: 110)
//                    .cornerRadius(10)
//                    .shadow(radius: 5)
//                    .onTapGesture {
//                            weekStore.selectedDate = week.dates[i]
//
//                    }
//                    .frame(maxWidth: .infinity)
//
//
//                    
//
//            }
//        }
//    }
//}
//
////struct WeekView_Previews: PreviewProvider {
////    static var previews: some View {
////        WeekView(week: .init(index: 1, dates:
////                                [
////                                    Date().yesterday.yesterday.yesterday,
////                                    Date().yesterday.yesterday,
////                                    Date().yesterday,
////                                    Date(),
////                                    Date().tomorrow,
////                                    Date().tomorrow.tomorrow,
////                                    Date().tomorrow.tomorrow.tomorrow
////                                ],
////                             referenceDate: Date()))
////        .environmentObject(WeekStore())
////
////    }
////}
