//
//  OneDimensionalBarChartView.swift
//  ToRoo
//
//  Created by Adry Mirza on 09/06/23.
//

import SwiftUI
import Charts

struct OneDimensionalBarChartView: View {
    @ObservedObject var healthStore: SleepManager
    @EnvironmentObject var weekStore: WeekStore
    var data: [(category: String, size: Double)] = []
    var selectedDay: Date
    private var totalPercentage: Double {
        let totalDuration = data.reduce(0) { $0 + $1.size }
        return (totalDuration / totalSize) * 100
    }
    
    var sleepFilter = SleepFiltering()

    
    init(healthStore: SleepManager, weekStore: WeekStore, data: [(category: String, size: Double)], selectedDay: Date) {
        self.healthStore = healthStore
        self.selectedDay = selectedDay
        self.data = healthStore.sleepData
             .reduce(into: [:]) { dict, entry in
                 dict[entry.sleepStages, default: 0] += entry.duration
             }
             .map { category, totalDuration in
                 return (category: category, size: totalDuration )
             }
        
        
        
    }
    
    private var totalSize: Double {
        data
            .reduce(0) { $0 + $1.size } * 100
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("ToRoo’s Zzzz Meter")
                    .font(.sfRoundedBold(fontSize: 24))
                    .foregroundColor(Color("PrimaryColor"))
                Spacer()
            }
            chart
            
        }
    }
    
    private var chart: some View {
        Chart(data, id: \.category) { element in
            let sizePercentage = (element.size / totalSize) * 100
            Plot {
                BarMark(
                    x: .value("Data Size", sizePercentage)
                )
                .foregroundStyle(by: .value("Data Category", element.category))
                .cornerRadius(30)
            }
            
        }
        .chartPlotStyle { plotArea in
            plotArea
                #if os(macOS)
                .background(Color.gray.opacity(0.2))
                #else
                .background(Color(.systemFill))
                #endif
                .cornerRadius(30)
        }
        .accessibilityChartDescriptor(self)
        .chartXAxis(.hidden)
        .chartXScale(range: 0...100)
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
        
        let categoryTotal = Dictionary(grouping: data, by: { $0.category })
            .mapValues { $0.reduce(0, { $0 + $1.size }) }
        
        let min = categoryTotal.values.min() ?? 0
        let max = categoryTotal.values.max() ?? 0
        

        let xAxis = AXCategoricalDataAxisDescriptor(
            title: "Category Total",
            categoryOrder: categoryTotal.keys.sorted()
        )

        let yAxis = AXNumericDataAxisDescriptor(
            title: "Size",
            range: Double(min)...Double(max),
            gridlinePositions: []
        ) { value in "\(String(format:"%.2f", value)) GB" }

        let series = AXDataSeriesDescriptor(
            name: "Data Usage Example",
            isContinuous: false,
            dataPoints: categoryTotal.map { (category, _) in
                            return .init(x: category, y: 0)
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
//
//struct OneDimensionalBarChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        OneDimensionalBarChartView(healthStore: SleepStore(), weekStore: WeekStore(), data: [],sleepFilteringFunc: SleepFilteringFunc(healthStore: weekStore, weekStore: <#WeekStore#>))
//    }
//}
