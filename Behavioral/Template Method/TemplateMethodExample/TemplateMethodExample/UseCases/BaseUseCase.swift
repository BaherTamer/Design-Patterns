//
//  BaseUseCase.swift
//  TemplateMethodExample
//
//  Created by Baher Tamer on 29/01/2026.
//

class BaseUseCase<Input, Output> {
    final func execute(_ input: Input) async throws -> Output {
        try validate(input)
        return try await process(input)
    }

    func validate(_ input: Input) throws {
        // Optional – override if needed
    }

    func process(_ input: Input) async throws -> Output {
        fatalError("Subclasses must override process(_:)")
    }
}
