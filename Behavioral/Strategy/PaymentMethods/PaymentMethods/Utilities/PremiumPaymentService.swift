//
//  PremiumPaymentService.swift
//  PaymentMethods
//
//  Created by Baher Tamer on 25/01/2026.
//

import Foundation

final class PremiumPaymentService {
    func requestIframe(cartId: String) async throws -> String {
        try await simulateNetworkDelay()
        let url = "https://premium.pay/iframe?cart_id=\(cartId)"
        print("🌐 Iframe URL received:", url)
        return url
    }

    func openIframeAndWaitForSuccess(iframeURL: String) async throws -> URL {
        print("🖥 Opening iframe:", iframeURL)
        try await simulateUserInteraction()
        let orderId = "10000563"
        let successURL = "myapp://payment-success?order_id=\(orderId)"
        print("🎉 Premium payment success:", successURL)
        return URL(string: successURL)!
    }

    private func simulateNetworkDelay() async throws {
        try await Task.sleep(nanoseconds: 800_000_000)
    }

    private func simulateUserInteraction() async throws {
        try await Task.sleep(nanoseconds: 1_500_000_000)
    }
}
