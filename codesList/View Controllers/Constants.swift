//
//  Constants.swift
//  codesList
//
//  Created by Briant Garza on 12/13/21.
//

import Foundation


struct Constants {
    static var currentUser: User? = nil
    
    static let validUsers = [
        User(firstName: "John", lastName: "Smith", username: "jsmith33", email: "johnsmith@gmail.com", password: "password"),
        User(firstName: "Briant", lastName: "Garza", username: "bg123", email: "briantgarza@my.cwi.edu", password: "password")
    ]
}
