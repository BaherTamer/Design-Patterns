//
//  GoogleAuthProvider.swift
//  LoginProviders
//
//  Created by Baher Tamer on 03/02/2026.
//

import Foundation

final class GoogleAuthProvider: AuthProvider {
    func login() async throws -> User {
        try await Task.sleep(for: .seconds(2))

        return User(
            id: UUID().uuidString,
            email: "user@gmail.com",
            displayName: "Google User",
            authProvider: "google"
        )
    }
}
