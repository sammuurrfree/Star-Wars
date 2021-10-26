//
//  Starships.swift
//  Star Wars
//
//  Created by Преподаватель on 15.10.2021.
//

import Foundation


class Vehicles {
    
    private func getVehicles(url: String?) -> PageVehiclesModel?{
        
        let semaphore = DispatchSemaphore (value: 0)
        var request = URLRequest(url: URL(string: url ?? "https://swapi.dev/api/vehicles/")!)
        var returnData: PageVehiclesModel?
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else { return }
            returnData = try? JSONDecoder().decode(PageVehiclesModel.self, from: data ?? Data())
            
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        
        return returnData
    }
    
    
    func getAllVehicles() -> [VehiclesModel] {
        var returnArray: [VehiclesModel] = []
        var flag = true
        
        var vehicles = getVehicles(url: nil)
        
        if vehicles != nil && vehicles!.next != nil{
            returnArray.append(contentsOf: vehicles!.results)
            
            while flag{
                vehicles = getVehicles(url: vehicles?.next)
                if vehicles?.next == nil{
                    flag = false
                    
                }else{
                    returnArray.append(contentsOf: vehicles!.results)
                }
                
            }
        }
        return returnArray
    }
    
}
