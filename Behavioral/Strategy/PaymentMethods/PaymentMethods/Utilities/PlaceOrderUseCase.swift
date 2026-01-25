//
//  PlaceOrderUseCase.swift
//  PaymentMethods
//
//  Created by Baher Tamer on 25/01/2026.
//


final class PlaceOrderUseCase {
    func execute(cartId: String) async throws -> String {
        try await simulateNetworkDelay()
        
        let orderId = "10000563"
        print("📦 Order created on backend:", orderId)
        return orderId
    }
    
    private func simulateNetworkDelay() async throws {
        try await Task.sleep(nanoseconds: 900_000_000)
    }
}
