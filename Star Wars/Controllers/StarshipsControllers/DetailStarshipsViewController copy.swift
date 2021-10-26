//
//  DetailPeopleViewController.swift
//  Star Wars
//
//  Created by Преподаватель on 15.10.2021.
//

import UIKit

class DetailStarshipsViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var costInCreditsLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var maxSpeedLabel: UILabel!
    @IBOutlet weak var crewLabel: UILabel!
    @IBOutlet weak var passengersLabel: UILabel!
    @IBOutlet weak var cargoCapacityLabel: UILabel!
    @IBOutlet weak var consumablesLabel: UILabel!
    @IBOutlet weak var hyperdriveRatingLabel: UILabel!
    @IBOutlet weak var mgltLabel: UILabel!
    @IBOutlet weak var starshipClassLabel: UILabel!
    
    var starshipsData: StarshipsModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    

    func loadData() {
        nameLabel.text = starshipsData?.name ?? ""
        modelLabel.text = starshipsData?.model ?? ""
        costInCreditsLabel.text = starshipsData?.cost_in_credits ?? ""
        lengthLabel.text = starshipsData?.length ?? ""
        maxSpeedLabel.text = starshipsData?.max_atmosphering_speed ?? ""
        crewLabel.text = starshipsData?.crew ?? ""
        passengersLabel.text = starshipsData?.passengers ?? ""
        cargoCapacityLabel.text = starshipsData?.cargo_capacity ?? ""
        consumablesLabel.text = starshipsData?.consumables ?? ""
        hyperdriveRatingLabel.text = starshipsData?.hyperdrive_rating ?? ""
        mgltLabel.text = starshipsData?.MGLT ?? ""
        starshipClassLabel.text = starshipsData?.starship_class ?? ""
    }

}
