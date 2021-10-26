//
//  DetailPeopleViewController.swift
//  Star Wars
//
//  Created by Преподаватель on 15.10.2021.
//

import UIKit

class DetailVehiclesViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var manufacturerLabel: UILabel!
    @IBOutlet weak var costInCreditsLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var maxSpeedLabel: UILabel!
    @IBOutlet weak var crewLabel: UILabel!
    @IBOutlet weak var passengersLabel: UILabel!
    @IBOutlet weak var cargoCapacityLabel: UILabel!
    @IBOutlet weak var consumablesLabel: UILabel!
    @IBOutlet weak var vehicleClass: UILabel!

    
    var vehiclesData: VehiclesModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    

    func loadData() {
        nameLabel.text = vehiclesData?.name ?? ""
        modelLabel.text = vehiclesData?.model ?? ""
        costInCreditsLabel.text = vehiclesData?.cost_in_credits ?? ""
        lengthLabel.text = vehiclesData?.length ?? ""
        maxSpeedLabel.text = vehiclesData?.max_atmosphering_speed ?? ""
        crewLabel.text = vehiclesData?.crew ?? ""
        passengersLabel.text = vehiclesData?.passengers ?? ""
        cargoCapacityLabel.text = vehiclesData?.cargo_capacity ?? ""
        consumablesLabel.text = vehiclesData?.consumables ?? ""
        manufacturerLabel.text = vehiclesData?.manufacturer ?? ""
        vehicleClass.text = vehiclesData?.vehicle_class ?? ""
    }

}
