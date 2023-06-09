//
//  ChartData.swift
//  ToRoo
//
//  Created by Safik Widiantoro on 08/06/23.
//

import Foundation

struct DataUsageData {

    /// A data series for the bars.
    struct Series: Identifiable {
        /// Data Group.
        let category: String

        /// Size of data in gigabytes?
        let size: Double

        /// The identifier for the series.
        var id: String { category }
    }

    static let example: [Series] = [
        .init(category: "Apps", size: 61.6)
    ]
}


