//
//  AnalyticsProvider.swift
//  AnalyticsExample
//
//  Created by Baher Tamer on 09/01/2026.
//

protocol AnalyticsProvider: Sendable {
    func logEvent(name: String)
}
