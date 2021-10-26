//
//  Planets.swift
//  Star Wars
//
//  Created by Преподаватель on 19.10.2021.
//

import Foundation

class Planets {
    
    private func getPlanets(url: String?) -> PagePlanetsModel?{
        
        let semaphore = DispatchSemaphore (value: 0)
        var request = URLRequest(url: URL(string: url ?? "https://swapi.dev/api/planets/")!)
        var returnData: PagePlanetsModel?
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            returnData = try? JSONDecoder().decode(PagePlanetsModel.self, from: data ?? Data())
            
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        
        return returnData
    }
    
    
    func getAllPlanets() -> [PlanetsModel] {
        var returnArray: [PlanetsModel] = []
        var flag = true
        
        var planets = getPlanets(url: nil)
        
        if planets != nil && planets!.next != nil{
            returnArray.append(contentsOf: planets!.results)
            
            while flag{
                planets = getPlanets(url: planets?.next)
                if planets?.next == nil{
                    flag = false
                    
                }else{
                    returnArray.append(contentsOf: planets!.results)
                }
                
            }
        }
        return returnArray
    }
    
}
