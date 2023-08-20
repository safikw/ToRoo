//
//  EventChart.swift
//  SleepWithToRoo
//
//  Created by Safik Widiantoro on 18/08/23.
//

import Foundation
import SwiftUI
import Charts

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
                                        Text("Duration: \(getEventsTotalDuration([selectedEvent]))")
                                            .font(.body.bold())
                                            .foregroundColor(Color("PrimaryColor"))
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
            "Unspecified": .black
        ]
        
        if let color = stageColors[stages] {
            return color.gradient
        }
        return Color.gray.gradient
    }
    
    private func getEventsTotalDuration(_ events: [SleepEntry]) -> String {
        var durationInSeconds: TimeInterval = 0
        for event in events {
            durationInSeconds += event.startDate.distance(to: event.endDate)
        }
        return getFormattedDuration(seconds: durationInSeconds)
    }
    
    private func getFormattedDuration(seconds: Double) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .pad
        formatter.allowedUnits = [.hour, .minute]
        
        return formatter.string(from: seconds) ?? "N/A"
    }
    
}
