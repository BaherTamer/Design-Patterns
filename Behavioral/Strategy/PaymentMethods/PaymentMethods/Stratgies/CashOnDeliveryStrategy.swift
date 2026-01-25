//
//  CashOnDeliveryStrategy.swift
//  PaymentMethods
//
//  Created by Baher Tamer on 25/01/2026.
//

final class CashOnDeliveryStrategy: PaymentStrategy {

    private let placeOrderUseCase: PlaceOrderUseCase

    init(placeOrderUseCase: PlaceOrderUseCase) {
        self.placeOrderUseCase = placeOrderUseCase
    }

    func pay(cartId: String) async throws -> String {
        print("💵 Cash on Delivery")
        let orderId = try await placeOrderUseCase.execute(cartId: cartId)
        return orderId
    }
}
