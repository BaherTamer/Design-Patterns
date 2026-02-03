//
//  EmailAuthProvider.swift
//  LoginProviders
//
//  Created by Baher Tamer on 03/02/2026.
//

final class EmailAuthProvider: AuthProvider {

    private let email: String
    private let password: String
    private let apiClient: AuthAPIClient

    init(
        email: String,
        password: String,
        apiClient: AuthAPIClient = DefaultAuthAPIClient()
    ) {
        self.email = email
        self.password = password
        self.apiClient = apiClient
    }

    func login() async throws -> User {
        try await apiClient.login(email: email, password: password)
    }
}
