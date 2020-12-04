//
//  User.swift
//  SwipableCards
//
//  Created by Ronald Joubert on 12/3/20.
//

import Foundation

struct User: Hashable, CustomStringConvertible {
    
    var id: Int
    
    let firstName: String
    let lastName: String
    let age: Int
    let mutualFriends: Int
    let imageName: String
    let occupation: String
    
    var description: String {
        return "\(firstName), id: \(id)"
    }
}
