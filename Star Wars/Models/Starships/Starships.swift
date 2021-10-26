//
//  Starships.swift
//  Star Wars
//
//  Created by Преподаватель on 15.10.2021.
//

import Foundation


class Starships {
    
    private func getStarhips(url: String?) -> PageStarshipsModel?{
        
        let semaphore = DispatchSemaphore (value: 0)
        var request = URLRequest(url: URL(string: url ?? "https://swapi.dev/api/starships/")!)
        var returnData: PageStarshipsModel?
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            returnData = try? JSONDecoder().decode(PageStarshipsModel.self, from: data ?? Data())
            
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        
        return returnData
    }
    
    
    func getAllStarships() -> [StarshipsModel] {
        var returnArray: [StarshipsModel] = []
        var flag = true
        
        var starships = getStarhips(url: nil)
        
        if starships != nil && starships!.next != nil{
            returnArray.append(contentsOf: starships!.results)
            
            while flag{
                starships = getStarhips(url: starships?.next)
                if starships?.next == nil{
                    flag = false
                    
                }else{
                    returnArray.append(contentsOf: starships!.results)
                }
                
            }
        }
        return returnArray
    }
    
}
