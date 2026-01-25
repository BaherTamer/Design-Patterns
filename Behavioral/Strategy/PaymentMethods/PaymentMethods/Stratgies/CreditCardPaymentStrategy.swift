//
//  CreditCardPaymentStrategy.swift
//  PaymentMethods
//
//  Created by Baher Tamer on 25/01/2026.
//

final class CreditCardPaymentStrategy: PaymentStrategy {

    private let paymentSDK: PaymentSDK
    private let cardInfo: CardInfo

    init(paymentSDK: PaymentSDK, cardInfo: CardInfo) {
        self.paymentSDK = paymentSDK
        self.cardInfo = cardInfo
    }

    func pay(cartId: String) async throws -> String {
        print("💳 Credit Card payment")

        let orderId = try await paymentSDK.pay(
            cartId: cartId,
            cardInfo: cardInfo
        )

        return orderId
    }
}
