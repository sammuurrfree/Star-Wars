//
//  People.swift
//  Star Wars
//
//  Created by Преподаватель on 14.10.2021.
//

import Foundation


class People {
    
    
    private func getPeople(url: String?) -> PagePeopleModel?{
        
        let semaphore = DispatchSemaphore (value: 0)
        var request = URLRequest(url: URL(string: url ?? "https://swapi.dev/api/people/")!)
        var returnData: PagePeopleModel?
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            returnData = try? JSONDecoder().decode(PagePeopleModel.self, from: data ?? Data())
            
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        
        return returnData
    }
    
    
    func getAllPeople() -> [PeopleModel] {
        var returnArray: [PeopleModel] = []
        var flag = true
        
        var people = getPeople(url: nil)
        
        if people != nil && people!.next != nil{
            returnArray.append(contentsOf: people!.results)
            
            while flag{
                people = getPeople(url: people?.next)
                if people?.next == nil{
                    flag = false
                    
                }else{
                    returnArray.append(contentsOf: people!.results)
                }
                
            }
        }
        return returnArray
    }
    
}
