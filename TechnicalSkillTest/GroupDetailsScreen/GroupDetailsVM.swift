//
//  GroupDetailsVM.swift
//  TechnicalSkillTest
//
//  Created by Juan Colilla on 14/10/21.
//

import Foundation
import RealmSwift

class GroupDetailsVM {
    
    var group: Group?
    var favorite: Favorite?
    
    let realm = try! Realm()
    
    func saveGroupToFavorites() {
        
        try! realm.write() {
            if let selectedGroup = group {
                
                let newFavorite = Favorite()
                newFavorite.id = selectedGroup.id ?? 0
                newFavorite.name = selectedGroup.name ?? ""
                newFavorite.date = selectedGroup.date ?? 0
                newFavorite.defaultImageURL = selectedGroup.defaultImageURL  ?? ""
                newFavorite.descriptionShort = selectedGroup.descriptionShort ?? ""
                newFavorite.groupDescription = selectedGroup.groupDescription ?? ""
                realm.add(newFavorite)
            }
        }
    }
    
    func deleteFavorite() {
        let primariKey = "\(group?.id ?? 0)"
        let objectToDelete = realm.object(ofType: Favorite.self, forPrimaryKey: primariKey)
        
        if objectToDelete != nil {
            realm.delete(objectToDelete!)
        }
    }
    
}
