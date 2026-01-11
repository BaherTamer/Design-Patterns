//
//  AdjustAnalyticsProvider.swift
//  AnalyticsExample
//
//  Created by Baher Tamer on 09/01/2026.
//

final class AdjustAnalyticsProvider: AnalyticsProvider {
    func logEvent(name: String) {
        print("Adjust: \(name)")
    }
}
