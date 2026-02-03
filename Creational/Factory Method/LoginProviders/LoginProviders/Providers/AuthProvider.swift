//
//  AuthProvider.swift
//  LoginProviders
//
//  Created by Baher Tamer on 03/02/2026.
//

protocol AuthProvider {
    func login() async throws -> User
}
