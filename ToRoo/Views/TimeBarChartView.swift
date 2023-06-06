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

    
    var body: some View {
        EventChart(events: healthStore.sleepData,
                   chartXScaleRangeStart: getScaleRange(hour: 1, minute: 0, second: 0),
                   chartXScaleRangeEnd: Date())
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
                            y: .value("stages", event.sleepStages)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    }
                }
            }
            .padding(.top, 40)
            .frame(height: Constants.detailChartHeight)
            .chartXScale(domain: chartXScaleRangeStart...chartXScaleRangeEnd)
        }
    }
}

struct TimeBarChartView_Previews: PreviewProvider {
    static var previews: some View {
        TimeBarChartView(healthStore: SleepStore())
    }
}
