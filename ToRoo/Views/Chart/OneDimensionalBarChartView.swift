//
//  OneDimensionalBarChartView.swift
//  ToRoo
//
//  Created by Adry Mirza on 09/06/23.
//

import SwiftUI
import Charts

struct OneDimensionalBarChartView: View {
    @ObservedObject var healthStore: SleepStore
    @EnvironmentObject var weekStore: WeekStore
    let dayChart: String
    let monthChart: String
    let yearChart: String
    var data: [(category: String, size: Double)] = []
    private var startOfOpeningHours: Date
    private var endOfOpeningHours: Date

    
    init(healthStore: SleepStore, weekStore: WeekStore, data: [(category: String, size: Double)]) {
        self.healthStore = healthStore
        self.dayChart = weekStore.selectedDate.toString(format: "dd")
        self.monthChart = weekStore.selectedDate.toString(format: "MM")
        self.yearChart = weekStore.selectedDate.toString(format: "yyyy")
        self.startOfOpeningHours = date(year: Int(yearChart)!, month: Int(monthChart)!, day: Int(dayChart)!, hour: 00, minutes: 00)
        self.endOfOpeningHours = date(year: Int(yearChart)!, month: Int(monthChart)!, day: Int(dayChart)!, hour: 08, minutes: 59)
        self.data = healthStore.sleepData.filter{ entry in
            return entry.sleepStages != "Unspecified" && entry.sleepStages != "In Bed" && entry.startDate >= startOfOpeningHours && entry.endDate <= endOfOpeningHours}.map{entry in
                return (category: entry.sleepStages, size: entry.duration)
            }
    }
    private var totalSize: Double {
        data
            .reduce(0) { $0 + $1.size }
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("ToRoo’s Zzzz Meter")
                Spacer()
//                Text("\(totalSize, specifier: "%.1f") GB of 100%")
//                    .foregroundColor(.secondary)
            }
            chart
        }
    }
    
    private var chart: some View {
        Chart(data, id: \.category) { element in
            Plot {
                BarMark(
                    x: .value("Data Size", element.size)
                )
                
                .foregroundStyle(getForegroundColor(stages: element.category))
            }
        }
        .chartPlotStyle { plotArea in
            plotArea
                #if os(macOS)
                .background(Color.gray.opacity(0.2))
                #else
                .background(Color(.systemFill))
                #endif
                .cornerRadius(8)
        }
        .accessibilityChartDescriptor(self)
        .chartXAxis(.hidden)
        .chartXScale(range: 0...128)
        .chartYScale(range: .plotDimension(endPadding: -8))
        .chartLegend(position: .bottom, spacing: 8)
        .chartLegend(.visible)
        .frame(height: 50)
    }
    private func getForegroundColor(stages: String) -> AnyGradient {
        
        let stageColors: [String: Color] = [
            "Core": .cyan,
            "Deep": .blue,
            "REM": .purple,
            "Awake": .orange,
            "In Bed": .brown,
            "Unspecified": .black
        ]
        
        if let color = stageColors[stages] {
            return color.gradient
        }
        return Color.gray.gradient
    }
}

extension OneDimensionalBarChartView: AXChartDescriptorRepresentable {
    func makeChartDescriptor() -> AXChartDescriptor {
        let min = data.map(\.size).min() ?? 0
        let max = data.map(\.size).max() ?? 0

        let xAxis = AXCategoricalDataAxisDescriptor(
            title: "Category",
            categoryOrder: data.map { $0.category }
        )

        let yAxis = AXNumericDataAxisDescriptor(
            title: "Size",
            range: Double(min)...Double(max),
            gridlinePositions: []
        ) { value in "\(String(format:"%.2f", value)) GB" }

        let series = AXDataSeriesDescriptor(
            name: "Data Usage Example",
            isContinuous: false,
            dataPoints: data.map {
                .init(x: $0.category, y: $0.size)
            }
        )

        return AXChartDescriptor(
            title: "Data Usage by category",
            summary: nil,
            xAxis: xAxis,
            yAxis: yAxis,
            additionalAxes: [],
            series: [series]
        )
    }

}

struct OneDimensionalBarChartView_Previews: PreviewProvider {
    static var previews: some View {
        OneDimensionalBarChartView(healthStore: SleepStore(), weekStore: WeekStore(), data: [])
    }
}
