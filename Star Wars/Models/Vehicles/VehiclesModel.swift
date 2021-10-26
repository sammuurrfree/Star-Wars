//
//  StarshipsModel.swift
//  Star Wars
//
//  Created by Преподаватель on 15.10.2021.
//

import Foundation


struct PageVehiclesModel: Codable{
    
    let count: Int
    let next: String?
    let previous: String?
    let results: [VehiclesModel]
}

struct VehiclesModel: Codable{
    
    let name: String?
    let model: String?
    let manufacturer: String?
    let cost_in_credits: String?
    let length: String?
    let max_atmosphering_speed: String?
    let crew: String?
    let passengers: String?
    let cargo_capacity: String?
    let consumables: String?
    let vehicle_class: String?

}
