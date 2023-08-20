////
////  SleepEfficiency.swift
////  ToRoo
////
////  Created by Safik Widiantoro on 10/06/23.
////
//
//import SwiftUI
//
//struct SleepEfficiency: View {
//    @State private var showingPopover = false
//    @StateObject var healthStore: SleepManager
//    @EnvironmentObject var weekStore: WeekStore
//    let dayChart: String
//    let monthChart: String
//    let yearChart: String
//    private var startOfOpeningHours: Date
//    private var endOfOpeningHours: Date
//    var filteredData: [SleepEntry] = []
//
//
//
//    init(healthStore: SleepManager, weekStore: WeekStore) {
//        self.dayChart = weekStore.selectedDate.toString(format: "dd")
//        self.monthChart = weekStore.selectedDate.toString(format: "MM")
//        self.yearChart = weekStore.selectedDate.toString(format: "yyyy")
//        self.startOfOpeningHours = date(year: Int(yearChart)!, month: Int(monthChart)!, day: Int(dayChart)!, hour: 00, minutes: 00)
//        self.endOfOpeningHours = date(year: Int(yearChart)!, month: Int(monthChart)!, day: Int(dayChart)!, hour: 23, minutes: 59)
//        self.filteredData = healthStore.sleepData.filter { entry in
//            let isWithinOpeningHours = entry.startDate >= self.startOfOpeningHours && entry.endDate <= self.endOfOpeningHours
//            return isWithinOpeningHours
//        }
//    }
//
//
//
//    var body: some View {
//
////        let filteredInBed = filteredData.filter { entry in
////            entry.startDate >= startOfOpeningHours && entry.endDate <= endOfOpeningHours && entry.sleepStages == "In Bed"
////        }
////
////        let filteredREM = filteredData.filter { entry in
////            entry.startDate >= startOfOpeningHours && entry.endDate <= endOfOpeningHours && entry.sleepStages == "REM"
////        }
////
////        let filteredAwake = filteredData.filter { entry in
////            entry.startDate >= startOfOpeningHours && entry.endDate <= endOfOpeningHours && entry.sleepStages == "Awake"
////        }
//
////        let totalUnspecified = filteredUnspecified.reduce(0) { $0 + $1.duration }/60
////        let totalInBed = filteredInBed.reduce(0) { $0 + $1.duration }/60
////        let totalREM = (filteredREM.reduce(0) { $0 + $1.duration })/60
////        let totalAwake = (filteredAwake.reduce(0) { $0 + $1.duration })/60
////
////        let sleepEfficiency = ((totalInBed  -  totalREM - totalAwake )/480)*100
//
//
//
//        VStack(alignment: .leading){
//            Text("Sleep Eficiency: ")
//                .font(.system(size: 16))
//            HStack(alignment: .top){
//                //TODO: Sleep Efficiency
////                Text("\(String(format: "%.2f", sleepEfficiency))%")
////                    .font(.system(size: 32))
////                    .foregroundColor(Color("PrimaryColor"))
////                    .fontWeight(.bold)
////                    .padding(.bottom, 10)
//                Button() {
//                    showingPopover.toggle()
//                }label: {
//                    Image(systemName: "info.circle")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 16)
//                }
////                .iOSPopover(isPresented: $showingPopover, arrowDirection: .up){
////                    ScrollViewReader { value in
////                        ScrollView{
////                            Text("""
////                The amount of time you spend actually sleeping while in bed is known as sleep  efficiency. This measurement should ideally be 85 percent or more for optimal health benefits\n(National Sleep Foundation, thensf.org).
////                """)
////                            .padding()
////                        }.frame(height: 155)
////                            .shadow(radius: 25)
////                    }
////                }
//            }
//        }
//
//    }
//}
//
////struct SleepEfficiency_Previews: PreviewProvider {
////    static var previews: some View {
////        SleepEfficiency()
////    }
////}
