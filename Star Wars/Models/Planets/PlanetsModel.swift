//
//  PlanetsModel.swift
//  Star Wars
//
//  Created by Преподаватель on 19.10.2021.
//

import Foundation

struct PagePlanetsModel: Codable{
    
    let count: Int
    let next: String?
    let previous: String?
    let results: [PlanetsModel]
}

struct PlanetsModel: Codable{
    
    let name: String?
    let rotation_period: String?
    let orbital_period: String?
    let diameter: String?
    let climate: String?
    let gravity: String?
    let terrain: String?
    let surface_water: String?
    let population: String?
}
