//
//  FavoriteVM.swift
//  TechnicalSkillTest
//
//  Created by Juan Colilla on 14/10/21.
//

import Foundation

class FavoriteVM {
    
    var favorites: [Group]?
    
    func getFavoritesCount() -> Int {
        guard let favorites = favorites else {
            return 0
        }
        return favorites.count
    }
    
    func getFavorites() -> [Group] {
        guard let favorites = favorites else {
            return [Group]()
        }
        return favorites
    }
    
    func getFavorite(at indexPath: Int) -> Group? {
        if indexPath <= getFavoritesCount() {
            return getFavorites()[indexPath]
        } else {
            return nil
        }
    }
    
}
