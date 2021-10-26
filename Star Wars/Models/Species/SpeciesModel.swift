//
//  SpeciesModel.swift
//  Star Wars
//
//  Created by Преподаватель on 19.10.2021.
//

import Foundation

struct PageSpeciesModel: Codable{
    
    let count: Int
    let next: String?
    let previous: String?
    let results: [SpeciesModel]
}

struct SpeciesModel: Codable{
    
    let name: String?
    let classification: String?
    let designation: String?
    let average_height: String?
    let skin_colors: String?
    let hair_colors: String?
    let eye_colors: String?
    let average_lifespan: String?
    let language: String?
}
