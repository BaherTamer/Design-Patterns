//
//  SlowMockProvider.swift
//  AnalyticsExample
//
//  Created by Baher Tamer on 23/01/2026.
//

@testable import AnalyticsExample
import Foundation

final class SlowMockProvider: AnalyticsProvider, @unchecked Sendable {
    private(set) var loggedEvents: [String] = []
    private let lock = NSLock()
    let delay: TimeInterval
    
    init(delay: TimeInterval = 0.1) {
        self.delay = delay
    }
    
    func logEvent(name: String) {
        Thread.sleep(forTimeInterval: delay)
        lock.lock()
        defer { lock.unlock() }
        loggedEvents.append(name)
    }
}
