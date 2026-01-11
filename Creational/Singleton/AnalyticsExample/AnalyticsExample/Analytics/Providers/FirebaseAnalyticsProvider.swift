//
//  FirebaseAnalyticsProvider.swift
//  AnalyticsExample
//
//  Created by Baher Tamer on 09/01/2026.
//

final class FirebaseAnalyticsProvider: AnalyticsProvider {
    func logEvent(name: String) {
        print("Firebase: \(name)")
    }
}
