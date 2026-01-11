//
//  AnalyticEvent.swift
//  AnalyticsExample
//
//  Created by Baher Tamer on 09/01/2026.
//

enum AnalyticEvent {
    case addToCart
}

extension AnalyticEvent {
    var name: String {
        switch self {
        case .addToCart:
            "ADD_TO_CART"
        }
    }
}
