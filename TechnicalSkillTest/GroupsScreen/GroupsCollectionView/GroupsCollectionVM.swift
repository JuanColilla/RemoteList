//
//  GroupsCollectionVM.swift
//  TechnicalSkillTest
//
//  Created by Juan Colilla on 13/10/21.
//

import Foundation
import RealmSwift

class GroupsCollectionVM {
    
    var groups: [Group] = [Group]()
    let realm = try! Realm()
    
    func fetchGroups(completion: @escaping () -> ()) {
        getData(completion: { groups in
            self.groups = groups
            completion()
        })
    }
    
    func getGroup(index: Int) -> Group? {
        if groups.count >= index {
            return groups[index]
        } else {
            return nil
        }
    }
    
    private func getData(completion: @escaping ([Group]) -> ()) {
        
        let parameters = ["Accept" : "application/json"]
        var groups: [Group] = [Group]()
        APICalls.shared.callAPI(endpoint: .getGroups, parameters: parameters) { groupsData in
            do {
                groups = try JSONDecoder().decode([Group].self, from: groupsData)
            } catch {
                print(error)
            }
            completion(groups)
        }
    }
    
}
