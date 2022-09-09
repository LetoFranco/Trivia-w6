//
//  Trivia.swift
//  Trivia
//
//  Created by Franco Leto on 08/09/2022.
//

import Foundation

struct Trivia: Codable {
  let categories: [Category]
  
  enum CodingKeys: String, CodingKey {
    case categories = "trivia_categories"
  }
}
