//
//  PaymentSDK.swift
//  PaymentMethods
//
//  Created by Baher Tamer on 25/01/2026.
//

final class PaymentSDK {
    func pay(cartId: String, cardInfo: CardInfo) async throws -> String {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        return "10000563"
    }
}
