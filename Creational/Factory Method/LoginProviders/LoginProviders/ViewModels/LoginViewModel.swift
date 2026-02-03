//
//  LoginViewModel.swift
//  LoginProviders
//
//  Created by Baher Tamer on 03/02/2026.
//

import Foundation

protocol LoginViewModel: AnyObject {
    var user: User? { get }
    
    func login(with type: AuthType) async
}

@Observable
final class DefaultLoginViewModel: LoginViewModel {

    private(set) var user: User?

    private let factory: AuthProviderFactory

    init(factory: AuthProviderFactory = DefaultAuthProviderFactory()) {
        self.factory = factory
    }

    func login(with type: AuthType) async {
        let provider = factory.makeAuthProvider(for: type)
        user = try? await provider.login()
    }
}
