//
//  AnalyticsThreadSafetyTests.swift
//  AnalyticsExampleTests
//
//  Created by Baher Tamer on 23/01/2026.
//

import Testing
@testable import AnalyticsExample

@Suite("Analytics Thread Safety Tests")
@MainActor
struct AnalyticsThreadSafetyTests {

    @Test("Concurrent provider registration should be safe")
    func concurrentProviderRegistration() async {
        let manager = TestableAnalyticsManager()
        
        await withTaskGroup(of: Void.self) { group in
            for _ in 0..<100 {
                group.addTask {
                    let provider = MockAnalyticsProvider()
                    await manager.register(provider)
                }
            }
        }
        
        // Should complete without crashes
        #expect(true)
    }

    @Test("Concurrent event logging should be thread-safe")
    func concurrentEventLogging() async {
        let manager = TestableAnalyticsManager()
        let provider = MockAnalyticsProvider()
        manager.register(provider)
        
        await withTaskGroup(of: Void.self) { group in
            for _ in 0..<1000 {
                group.addTask {
                    await manager.logEvent(.addToCart)
                }
            }
        }
        
        #expect(provider.loggedEvents.count == 1000)
    }
    
    @Test("Race condition between register and log should not crash")
    func raceConditionBetweenRegisterAndLog() async {
        let manager = TestableAnalyticsManager()
        let provider = MockAnalyticsProvider()
        manager.register(provider)
        
        await withTaskGroup(of: Void.self) { group in
            // Register providers concurrently
            for _ in 0..<50 {
                group.addTask {
                    await manager.register(MockAnalyticsProvider())
                }
            }
            
            // Log events concurrently
            for _ in 0..<50 {
                group.addTask {
                    await manager.logEvent(.addToCart)
                }
            }
        }
        
        // Should complete without crashes or data corruption
        #expect(true)
        #expect(provider.loggedEvents.count == 50)
    }
    
    @Test("High concurrency stress test", .timeLimit(.minutes(1)))
    func highConcurrencyStressTest() async {
        let manager = TestableAnalyticsManager()
        let provider = MockAnalyticsProvider()
        manager.register(provider)
        
        await withTaskGroup(of: Void.self) { group in
            for _ in 0..<10 {
                group.addTask {
                    for _ in 0..<100 {
                        await manager.logEvent(.addToCart)
                    }
                }
            }
        }
        
        #expect(provider.loggedEvents.count == 1000)
    }
    
}
