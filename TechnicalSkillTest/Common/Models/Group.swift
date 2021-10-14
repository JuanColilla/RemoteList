//
//  Group.swift
//  TechnicalSkillTest
//
//  Created by Juan Colilla on 13/10/21.
//

import Foundation
import RealmSwift

// MARK: - Group Model
struct Group: Codable {
    let date: Int?
    let defaultImageURL: String?
    let groupDescription, descriptionShort: String?
    let id: Int?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case date
        case defaultImageURL = "defaultImageUrl"
        case groupDescription = "description"
        case descriptionShort, id, name
    }
}

// MARK: Group Realm Object

class Favorite: Object {
    @objc dynamic var date: Int = 0
    @objc dynamic var defaultImageURL: String = ""
    @objc dynamic var groupDescription: String = ""
    @objc dynamic var descriptionShort: String = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
      }
}
