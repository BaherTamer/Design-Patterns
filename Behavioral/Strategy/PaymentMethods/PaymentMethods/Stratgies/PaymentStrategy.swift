//
//  PaymentStrategy.swift
//  PaymentMethods
//
//  Created by Baher Tamer on 25/01/2026.
//

protocol PaymentStrategy {
    func pay(cartId: String) async throws -> String
}
