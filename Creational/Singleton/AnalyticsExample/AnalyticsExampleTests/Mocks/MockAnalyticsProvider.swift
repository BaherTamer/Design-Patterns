//
//  MockAnalyticsProvider.swift
//  AnalyticsExample
//
//  Created by Baher Tamer on 23/01/2026.
//

@testable import AnalyticsExample
import Foundation

final class MockAnalyticsProvider: AnalyticsProvider, @unchecked Sendable {
    private(set) var loggedEvents: [String] = []
    private let lock = NSLock()
    
    func logEvent(name: String) {
        lock.lock()
        defer { lock.unlock() }
        loggedEvents.append(name)
    }
    
    func reset() {
        lock.lock()
        defer { lock.unlock() }
        loggedEvents.removeAll()
    }
}
