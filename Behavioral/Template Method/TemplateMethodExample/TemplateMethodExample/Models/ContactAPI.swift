//
//  ContactAPI.swift
//  TemplateMethodExample
//
//  Created by Baher Tamer on 29/01/2026.
//

protocol ContactAPI {
    func submitContact(_ input: ContactUsInput) async throws
}
