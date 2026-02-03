//
//  AuthProviderFactory.swift
//  LoginProviders
//
//  Created by Baher Tamer on 03/02/2026.
//

protocol AuthProviderFactory {
    func makeAuthProvider(for type: AuthType) -> AuthProvider
}

final class DefaultAuthProviderFactory: AuthProviderFactory {
    func makeAuthProvider(for type: AuthType) -> AuthProvider {
        switch type {
        case let .email(email, password):
            return EmailAuthProvider(email: email, password: password)

        case .apple:
            return AppleAuthProvider()

        case .google:
            return GoogleAuthProvider()
        }
    }
}
