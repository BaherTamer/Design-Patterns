//
//  MultiAnalyticsManager.swift
//  AnalyticsExample
//
//  Created by Baher Tamer on 11/01/2026.
//

final class MultiAnalyticsManager: AnalyticsManager {
    // MARK: - Singleton
    static let shared = MultiAnalyticsManager()
    private init() {}
    
    // MARK: - Variables
    private var providers: [AnalyticsProvider] = []
}

// MARK: - Core Functions
extension MultiAnalyticsManager {
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
}
