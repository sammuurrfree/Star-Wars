//
//  DetailPlanetsViewController.swift
//  Star Wars
//
//  Created by Преподаватель on 19.10.2021.
//

import UIKit

class DetailPlanetsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rotationPeriodLabel: UILabel!
    @IBOutlet weak var orbitalPeriodLabel: UILabel!
    @IBOutlet weak var diameterLabel: UILabel!
    @IBOutlet weak var climateLabel: UILabel!
    @IBOutlet weak var gravityLabel: UILabel!
    @IBOutlet weak var terrainLabel: UILabel!
    @IBOutlet weak var surfaceWaterLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    
    
    var planetsData: PlanetsModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    

    func loadData() {
        
        nameLabel.text = planetsData?.name ?? ""
        rotationPeriodLabel.text = planetsData?.rotation_period ?? ""
        orbitalPeriodLabel.text = planetsData?.orbital_period ?? ""
        climateLabel.text = planetsData?.climate ?? ""
        gravityLabel.text = planetsData?.gravity ?? ""
        terrainLabel.text = planetsData?.terrain ?? ""
        surfaceWaterLabel.text = planetsData?.surface_water ?? ""
        populationLabel.text = planetsData?.population ?? ""
        diameterLabel.text = planetsData?.diameter ?? ""
    }
}
