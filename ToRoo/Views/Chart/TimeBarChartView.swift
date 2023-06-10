//
//  TimeBarChartView.swift
//  ToRoo
//
//  Created by Adry Mirza on 05/06/23.
//

import SwiftUI
import Charts

struct TimeBarChartView: View {
    @ObservedObject var healthStore: SleepStore
    @EnvironmentObject var weekStore: WeekStore
    let dayChart: String
    let monthChart: String
    let yearChart: String
    private var startOfOpeningHours: Date
    private var endOfOpeningHours: Date
    
    init(healthStore: SleepStore, weekStore: WeekStore) {
        self.healthStore = healthStore
        self.dayChart = weekStore.selectedDate.toString(format: "dd")
        self.monthChart = weekStore.selectedDate.toString(format: "MM")
        self.yearChart = weekStore.selectedDate.toString(format: "yyyy")
        self.startOfOpeningHours = date(year: Int(yearChart)!, month: Int(monthChart)!, day: Int(dayChart)!, hour: 00, minutes: 00)
        self.endOfOpeningHours = date(year: Int(yearChart)!, month: Int(monthChart)!, day: Int(dayChart)!, hour: 23, minutes: 59)
    }
    
        
        
        var body: some View {
            VStack{
                let filteredEntries = healthStore.sleepData.filter { entry in
                    entry.startDate >= startOfOpeningHours && entry.endDate <= endOfOpeningHours && entry.sleepStages != "Unspecified" && entry.sleepStages != "In Bed"
                }
                

                let totalDuration = filteredEntries.reduce(0) { $0 + $1.duration }
                
                HStack{
                    VStack(alignment: .leading){
                        Text("TIME ASLEEP")
                        Text("\(healthStore.formatDuration(totalDuration))")
                    }
                    
                    Spacer()
                }
                
                
                EventChart(events: healthStore.sleepData.filter{ entry in
                    return entry.sleepStages != "Unspecified" && entry.sleepStages != "In Bed" },
                           chartXScaleRangeStart: startOfOpeningHours,
                           chartXScaleRangeEnd: endOfOpeningHours)
            }
        }
        
        
    static func getEventsTotalDuration(_ events: [SleepEntry]) -> String {
        var durationInSeconds: TimeInterval = 0
        for event in events {
            durationInSeconds += event.startDate.distance(to: event.endDate)
        }
        return getFormattedDuration(seconds: durationInSeconds)
    }

    static func getFormattedDuration(seconds: Double) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.hour, .minute]

        return formatter.string(from: seconds) ?? "N/A"
    }
        
    }



struct EventChart: View {
    @State private var selectedEvent: (SleepEntry)?
    @State private var plotWidth: CGFloat = 0
    
    var events: [SleepEntry]
    var chartXScaleRangeStart: Date
    var chartXScaleRangeEnd: Date
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Chart {
                ForEach(events, id: \.startDate) { event in
                    Plot {
                        BarMark(
                            xStart: .value("Clocking In", event.startDate),
                            xEnd: .value("Clocking Out", event.endDate),
                            y: .value("Stages", event.sleepStages)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .foregroundStyle(getForegroundColor(stages: event.sleepStages))
                        
                        if let selectedEvent, selectedEvent == event {
                            RuleMark(x: .value("Event Middle", getEventMiddle(start: selectedEvent.startDate, end: selectedEvent.endDate)))
                                .lineStyle(.init(lineWidth: 2, miterLimit: 2, dash: [2], dashPhase: 5))
                                .offset(x: (plotWidth / getEventMiddle(start: selectedEvent.startDate, end: selectedEvent.endDate))) // Align with middle of bar
                                .annotation(position: .top) {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text("Duration: \(TimeBarChartView.getEventsTotalDuration([selectedEvent]))")
                                            .font(.body.bold())
                                            .foregroundColor(Color("CalendarHover"))
                                    }
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background {
                                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                                            .fill(.white.shadow(.drop(radius: 2)))
                                    }
                                }
                        }
                    }
                }
            }
            .padding(.top, 40)
            .frame(height: Constants.detailChartHeight)
            .chartXScale(domain: chartXScaleRangeStart...chartXScaleRangeEnd)
            .chartOverlay { proxy in
                GeometryReader { geoProxy in
                    Rectangle()
                        .fill(.clear).contentShape(Rectangle())
                        .gesture(
                            SpatialTapGesture()
                                .onEnded { value in
                                    let location = value.location
                                    if let date: Date = proxy.value(atX: location.x) {
                                        if let event = events.first(where: { sleepEntry in
                                            date >= sleepEntry.startDate && date <= sleepEntry.endDate
                                        }) {
                                            self.selectedEvent = event
                                            self.plotWidth = proxy.plotAreaSize.width
                                        }
                                    }
                                }
                        )
                }
            }
        }
    }
    
    private func getEventMiddle(start: Date, end: Date) -> Date {
        Date(timeInterval: (end.timeIntervalSince1970 - start.timeIntervalSince1970) / 2, since: start)
    }

    private func getEventMiddle(start: Date, end: Date) -> CGFloat {
        CGFloat((start.timeIntervalSince1970 + end.timeIntervalSince1970) / 2)
    }
    
    private func getForegroundColor(stages: String) -> AnyGradient {
        
        let stageColors: [String: Color] = [
            "Core": .cyan,
            "Deep": .blue,
            "REM": .purple,
            "Awake": .orange,
            "In Bed": .brown,
            "Unis": .black
        ]
        
        if let color = stageColors[stages] {
            return color.gradient
        }
        return Color.gray.gradient
    }
    
    
}

//struct TimeBarChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimeBarChartView(healthStore: SleepStore(), weekStore: WeekStore(), sleepEntry: SleepEntry)
//    }
//}
