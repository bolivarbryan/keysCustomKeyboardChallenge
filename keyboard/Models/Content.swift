//
//  Content.swift
//  keysCustomKeyboardChallenge
//
//  Created by Bryan A Bolivar M on 27/07/22.
//

import Foundation

struct Category: Identifiable, Codable {
    var id = UUID()
    let name: String
    let subcategories: [Subcategory]
}

struct Subcategory: Identifiable, Codable {
    var id = UUID()
    let name: String
}
