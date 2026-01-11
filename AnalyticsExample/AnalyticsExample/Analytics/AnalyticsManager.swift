//
//  AnalyticsManager.swift
//  AnalyticsExample
//
//  Created by Baher Tamer on 09/01/2026.
//

@MainActor
protocol AnalyticsManager {
    func register(_ provider: AnalyticsProvider)
    func logEvent(_ event: AnalyticEvent)
}
