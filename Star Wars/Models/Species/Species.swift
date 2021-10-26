//
//  Species.swift
//  Star Wars
//
//  Created by Преподаватель on 19.10.2021.
//

import Foundation

class Species {
    
    private func getSpecies(url: String?) -> PageSpeciesModel?{
        
        let semaphore = DispatchSemaphore (value: 0)
        var request = URLRequest(url: URL(string: url ?? "https://swapi.dev/api/species/")!)
        var returnData: PageSpeciesModel?
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            returnData = try? JSONDecoder().decode(PageSpeciesModel.self, from: data ?? Data())
            
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        
        return returnData
    }
    
    
    func getAllSpecies() -> [SpeciesModel] {
        var returnArray: [SpeciesModel] = []
        var flag = true
        
        var species = getSpecies(url: nil)
        
        if species != nil && species!.next != nil{
            returnArray.append(contentsOf: species!.results)
            
            while flag{
                species = getSpecies(url: species?.next)
                if species?.next == nil{
                    flag = false
                    
                }else{
                    returnArray.append(contentsOf: species!.results)
                }
                
            }
        }
        return returnArray
    }
    
}
