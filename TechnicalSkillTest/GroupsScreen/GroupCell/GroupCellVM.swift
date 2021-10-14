//
//  GroupCellVM.swift
//  TechnicalSkillTest
//
//  Created by Juan Colilla on 13/10/21.
//

import Foundation

class GroupCellVM {
    
    var group: Group?
    
    func getName() -> String {
        guard let name = group?.name else { return "Group" }
        return name
    }
    
//    func getDate() -> String {
//        guard let group = group else { return "Group" }
//        return group
//    }
    
    func getShortDescription() -> String {
        guard let shortDescription = group?.descriptionShort else { return "Short description" }
        return shortDescription
    }
    
    func getImageURL() -> String {
        guard let imageURL = group?.defaultImageURL else { return "" }
        return imageURL
    }
    
}
