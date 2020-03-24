//
//  PublishDiagnosticsParams.swift
//  SwiftLSPClient
//
//  Created by Matt Massicotte on 2019-01-21.
//  Copyright © 2019 Chime Systems. All rights reserved.
//

import Foundation

public struct DiagnosticRelatedInformation: Codable {
    public let location: Location
    public let message: String
}

extension DiagnosticRelatedInformation: Equatable {
}

public enum DiagnosticCode: Codable {
    case number(Int)
    case string(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else {
            let value = try container.decode(Int.self)
            self = .number(value)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .string(let value):
            try container.encode(value)
        case .number(let value):
            try container.encode(value)
        }
    }
}

extension DiagnosticCode: Equatable {
}

public struct Diagnostic: Codable {
    public let range: LSPRange
    public let severity: Int?
    public let code: DiagnosticCode?
    public let source: String?
    public let message: String
    public let relatedInformation: [DiagnosticRelatedInformation]?
}

extension Diagnostic: Equatable {
}

public struct PublishDiagnosticsParams: Codable {
    public let uri: DocumentUri
    public let diagnostics: [Diagnostic]
}

