//
//  TemplateMethodExampleApp.swift
//  TemplateMethodExample
//
//  Created by Baher Tamer on 29/01/2026.
//

import SwiftUI

@main
struct TemplateMethodExampleApp: App {
    var body: some Scene {
        WindowGroup {
            EmptyView()
        }
    }
}

final class Presenter {
    private let contactUsUseCase: ContactUsUseCase
    
    init(contactUsUseCase: ContactUsUseCase) {
        self.contactUsUseCase = contactUsUseCase
    }
    
    func submitTapped() {
        Task { [weak self] in
            let input = ContactUsInput(
                name: "Name",
                email: "email@email.com",
                message: "message"
            )
            
            let output = try? await self?.contactUsUseCase.execute(input)
        }
    }
}
