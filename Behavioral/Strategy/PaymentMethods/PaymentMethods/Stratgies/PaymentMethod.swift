//
//  PaymentMethod.swift
//  PaymentMethods
//
//  Created by Baher Tamer on 25/01/2026.
//

enum PaymentMethod: String, CaseIterable {
    case cashOnDelivery
    case creditCard
    case premium
}

extension PaymentMethod: Hashable, Identifiable {
    var id: String { rawValue }
}

extension PaymentMethod {
    var strategy: PaymentStrategy {
        let strategy: PaymentStrategy
        
        switch self {
        case .cashOnDelivery:
            strategy = CashOnDeliveryStrategy(
                placeOrderUseCase: PlaceOrderUseCase()
            )

        case .creditCard:
            strategy = CreditCardPaymentStrategy(
                paymentSDK: PaymentSDK(),
                cardInfo: CardInfo(
                    number: "4111 1111 1111 1111",
                    expiry: "12/26",
                    cvv: "123"
                )
            )

        case .premium:
            strategy = PremiumPaymentStrategy(
                premiumService: PremiumPaymentService()
            )
        }
        
        return strategy
    }
}
