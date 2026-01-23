//
//  LegacyNetworkAdapter.swift
//  ClosuresAdapter
//
//  Created by Baher Tamer on 23/01/2026.
//

import Foundation

final class LegacyNetworkAdapter: UserRepository {
    private let legacyAPI = LegacyNetworkAPI()
    
    // Convert closure-based API to async/await
    func fetchUser(id: String) async throws -> User {
        try await withCheckedThrowingContinuation { continuation in
            legacyAPI.getUserData(userId: id) { result in
                switch result {
                case .success(let data):
                    guard
                        let id = data["id"] as? String,
                        let name = data["name"] as? String,
                        let email = data["email"] as? String
                    else {
                        continuation.resume(throwing: URLError.errorDomain as! Error)
                        return
                    }
                    let user = User(id: id, name: name, email: email)
                    continuation.resume(returning: user)
                    
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
