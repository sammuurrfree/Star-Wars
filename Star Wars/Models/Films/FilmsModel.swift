//
//  StarshipsModel.swift
//  Star Wars
//
//  Created by Преподаватель on 15.10.2021.
//

import Foundation


struct PageFilmsModel: Codable{
    
    let count: Int
    let next: String?
    let previous: String?
    let results: [FilmsModel]
}

struct FilmsModel: Codable{
    
    let title: String?
    let episode_id: Int?
    let opening_crawl: String?
    let director: String?
    let producer: String?
    let max_atmosphering_speed: String?
    let release_date: String?

}
