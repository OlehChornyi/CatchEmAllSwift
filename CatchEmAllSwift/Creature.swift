//
//  Creature.swift
//  CatchEmAllSwift
//
//  Created by Oleh on 05.02.2025.
//

import Foundation

struct Creature: Codable, Identifiable {
    let id = UUID().uuidString
    var name: String
    var url: String
    
    enum CodingKeys: CodingKey {
        case name
        case url
    }
}
