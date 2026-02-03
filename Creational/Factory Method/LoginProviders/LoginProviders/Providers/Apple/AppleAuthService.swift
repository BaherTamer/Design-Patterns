//
//  AppleAuthService.swift
//  LoginProviders
//
//  Created by Baher Tamer on 03/02/2026.
//

import Foundation

protocol AppleAuthService {
    func signIn() async throws -> (userID: String, email: String?, fullName: String?)
}

final class DefaultAppleAuthService: AppleAuthService {
    func signIn() async throws -> (userID: String, email: String?, fullName: String?) {
        try await Task.sleep(for: .seconds(2))

        return (
            userID: UUID().uuidString,
            email: "user@icloud.com",
            fullName: "Apple User"
        )
    }
}
