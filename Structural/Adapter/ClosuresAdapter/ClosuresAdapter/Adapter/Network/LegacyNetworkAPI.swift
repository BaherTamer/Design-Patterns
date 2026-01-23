//
//  LegacyNetworkAPI.swift
//  ClosuresAdapter
//
//  Created by Baher Tamer on 23/01/2026.
//

import Foundation

final class LegacyNetworkAPI {
    func getUserData(
        userId: String,
        completion: @escaping (Result<[String: Any], Error>) -> Void
    ) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) {
            let data: [String: Any] = [
                "id": userId,
                "name": "John Doe",
                "email": "john@example.com"
            ]
            completion(.success(data))
        }
    }
}
