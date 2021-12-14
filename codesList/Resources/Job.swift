//
//  Job.swift
//  codesList
//
//  Created by Briant Garza on 12/13/21.
//

import Foundation


struct Job: Decodable {
    enum Category: String, Decodable {
        case internship, full, part, freelance
    }
    
    let title: String
    let description: String
    let employerName: String
    let category: Category
    
}
