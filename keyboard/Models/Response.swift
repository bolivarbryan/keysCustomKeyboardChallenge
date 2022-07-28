//
//  Response.swift
//  keysCustomKeyboardChallenge
//
//  Created by Bryan A Bolivar M on 27/07/22.
//

import Foundation

// MARK: - Response
struct Response: Codable {
    let content: [ContentResponse]
}

// MARK: - Content
struct ContentResponse: Codable {
    let id, displayText: String
    let content: [String]
}
