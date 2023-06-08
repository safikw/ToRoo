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
    private var startOfOpeningHours: Date
    private var endOfOpeningHours: Date
    init(healthStore: SleepStore, weekStore: WeekStore) {
        self.healthStore = healthStore
        self.dayChart = weekStore.selectedDate.toString(format: "dd")
        self.startOfOpeningHours = date(year: 2023, month: 6, day: Int(dayChart)!, hour: 00, minutes: 00)
        self.endOfOpeningHours = date(year: 2023, month: 6, day: Int(dayChart)!, hour: 23, minutes: 59)
    }
    

    
    var body: some View {

        EventChart(events: healthStore.sleepData,
                   chartXScaleRangeStart: startOfOpeningHours,
                   chartXScaleRangeEnd: endOfOpeningHours)
    }
    
    func formatDuration(_ duration: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: duration) ?? ""
    }
    

    
    func getScaleRange(hour: Int, minute: Int, second: Int) -> Date{
        let calendar = Calendar.current
        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.day = -3
        guard let yesterday = calendar.date(byAdding: dateComponents, to: currentDate) else {
            fatalError("Failed to calculate yesterday's date")
        }
        
        // Create the date components
        var rangeDate = calendar.dateComponents([.year, .month, .day], from: yesterday)
        rangeDate.hour = hour
        rangeDate.minute = minute
        rangeDate.second = second

        // Fetch the value
        guard let rangeDate = calendar.date(from: rangeDate) else {
            fatalError("Failed to calculate requested date")
        }
        return rangeDate
    }
}


struct EventChart: View {
    @State private var plotWidth: CGFloat = 0
    @State var events: [SleepEntry]
    var chartXScaleRangeStart: Date
    var chartXScaleRangeEnd: Date
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            ForEach(events.indices, id: \.self) { event in
                Text("\(event)")
            }
            
            Chart {
                ForEach(events, id: \.startDate) { event in
                    Plot {
                        BarMark(
                            xStart: .value("Clocking In", event.startDate),
                            xEnd: .value("Clocking Out", event.endDate),
                            y: .value("stages", event.sleepStages)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .foregroundStyle(getForegroundColor(stages: event.sleepStages))
                    }
                }
            }
            .padding(.top, 40)
            .frame(height: Constants.detailChartHeight)
            .chartXScale(domain: chartXScaleRangeStart...chartXScaleRangeEnd)
        }
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
