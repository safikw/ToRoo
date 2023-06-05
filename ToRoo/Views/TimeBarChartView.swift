//
//  TimeBarChartView.swift
//  ToRoo
//
//  Created by Adry Mirza on 05/06/23.
//

import SwiftUI
import Charts

struct TimeBarChartView: View {
    @StateObject var healthStore = SleepStore()

    var body: some View {
        EventChart(events: healthStore.sleepData,
                       chartXScaleRangeStart: Date(),
                       chartXScaleRangeEnd: Date())
    }

}

struct EventChart: View {
//    @State private var selectedEvent: (stages: String, clockIn: Date, clockOut: Date)?
    @State private var plotWidth: CGFloat = 0
    var events: [SleepEntry]
    var chartXScaleRangeStart: Date
    var chartXScaleRangeEnd: Date

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Chart {
                ForEach(events, id: \.id) { event in
                    Plot {
                        BarMark(
                            xStart: .value("Clocking In", event.startDate),
                            xEnd: .value("Clocking Out", event.endDate),
                            y: .value("stages", "REM") // Data masih statis karna blm diconvert int jd string
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

//struct TimeBarChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimeBarChartView()
//    }
//}
