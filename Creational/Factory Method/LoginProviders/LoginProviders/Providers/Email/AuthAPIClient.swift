//
//  AuthAPIClient.swift
//  LoginProviders
//
//  Created by Baher Tamer on 03/02/2026.
//

import Foundation

protocol AuthAPIClient {
    func login(email: String, password: String) async throws -> User
}

final class DefaultAuthAPIClient: AuthAPIClient {
    func login(email: String, password: String) async throws -> User {
        try await Task.sleep(for: .seconds(2))

        return User(
            id: UUID().uuidString,
            email: email,
            displayName: email.components(separatedBy: "@").first,
            authProvider: "email"
        )
    }
}
