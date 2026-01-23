//
//  UserRepository.swift
//  ClosuresAdapter
//
//  Created by Baher Tamer on 23/01/2026.
//

protocol UserRepository {
    func fetchUser(id: String) async throws -> User
}
