//
//  TestableAnalyticsManager.swift
//  AnalyticsExample
//
//  Created by Baher Tamer on 23/01/2026.
//

@testable import AnalyticsExample
import Foundation

final class TestableAnalyticsManager: AnalyticsManager {
    private var providers: [AnalyticsProvider] = []
    
    func register(_ provider: AnalyticsProvider) {
        guard
            !providers.contains(where: {
                type(of: $0) == type(of: provider)
            })
        else { return }
        providers.append(provider)
    }
    
    func logEvent(_ event: AnalyticEvent) {
        for provider in providers {
            provider.logEvent(name: event.name)
        }
    }
    
    func reset() {
        providers.removeAll()
    }
}
