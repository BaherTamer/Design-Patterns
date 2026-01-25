//
//  PremiumPaymentStrategy.swift
//  PaymentMethods
//
//  Created by Baher Tamer on 25/01/2026.
//

import Foundation

final class PremiumPaymentStrategy: PaymentStrategy {

    private let premiumService: PremiumPaymentService

    init(premiumService: PremiumPaymentService) {
        self.premiumService = premiumService
    }

    func pay(cartId: String) async throws -> String {
        print("🌟 Premium payment")

        let iframeURL = try await premiumService.requestIframe(cartId: cartId)

        let successURL = try await premiumService.openIframeAndWaitForSuccess(
            iframeURL: iframeURL
        )

        let orderId = try extractOrderId(from: successURL)
        return orderId
    }

    private func extractOrderId(from url: URL) throws -> String {
        guard
            let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
            let orderId = components.queryItems?
                .first(where: { $0.name == "order_id" })?
                .value
        else { throw URLError(.badURL) }

        return orderId
    }
}
