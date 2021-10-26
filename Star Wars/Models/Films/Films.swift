//
//  Starships.swift
//  Star Wars
//
//  Created by Преподаватель on 15.10.2021.
//

import Foundation


class Films{
    
    private func getFilms(url: String?) -> PageFilmsModel?{
        
        let semaphore = DispatchSemaphore (value: 0)
        var request = URLRequest(url: URL(string: url ?? "https://swapi.dev/api/films/")!)
        var returnData: PageFilmsModel?
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            returnData = try? JSONDecoder().decode(PageFilmsModel.self, from: data ?? Data())
            
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        
        return returnData
    }
    
    
    func getAllFilms() -> [FilmsModel] {
        var returnArray: [FilmsModel] = []
        var flag = true
        
        var films = getFilms(url: nil)
        
        guard films == nil else{
            return films?.results ?? []
        }
                
        if films!.next != nil{
            
            while flag{
                films = getFilms(url: films?.next)
                if films?.next == nil{
                    flag = false
                    
                }else{
                    returnArray.append(contentsOf: films!.results)
                }
                
            }
        }
        return returnArray
    }
    
}
