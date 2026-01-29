//
//  ContactUsUseCase.swift
//  TemplateMethodExample
//
//  Created by Baher Tamer on 29/01/2026.
//

final class ContactUsUseCase: BaseUseCase<ContactUsInput, ContactUsOutput> {

    private let api: ContactAPI

    init(api: ContactAPI) {
        self.api = api
    }

    override func validate(_ input: ContactUsInput) throws {
        if input.name.isEmpty {
            throw ValidationError.emptyName
        }

        if !input.email.contains("@") {
            throw ValidationError.invalidEmail
        }

        if input.message.isEmpty {
            throw ValidationError.emptyMessage
        }
    }

    override func process(_ input: ContactUsInput) async throws -> ContactUsOutput {
        try await api.submitContact(input)
        return ContactUsOutput(
            successMessage: "Thanks for contacting us!"
        )
    }
}
