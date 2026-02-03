//
//  AppleAuthProvider.swift
//  LoginProviders
//
//  Created by Baher Tamer on 03/02/2026.
//

final class AppleAuthProvider: AuthProvider {

    private let appleService: AppleAuthService

    init(appleService: AppleAuthService = DefaultAppleAuthService()) {
        self.appleService = appleService
    }

    func login() async throws -> User {
        let result = try await appleService.signIn()

        return User(
            id: result.userID,
            email: result.email,
            displayName: result.fullName,
            authProvider: "apple"
        )
    }
}
