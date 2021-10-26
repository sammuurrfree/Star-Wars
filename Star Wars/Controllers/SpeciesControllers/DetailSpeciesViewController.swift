//
//  DetailSpeciesViewController.swift
//  Star Wars
//
//  Created by Преподаватель on 19.10.2021.
//

import UIKit

class DetailSpeciesViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var classificationLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var averageHeightLabel: UILabel!
    @IBOutlet weak var skinColorsLabel: UILabel!
    @IBOutlet weak var hairColorsLabel: UILabel!
    @IBOutlet weak var eyeColorsLabel: UILabel!
    @IBOutlet weak var averageLifespanLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    
    
    var speciesData: SpeciesModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    

    func loadData() {
        nameLabel.text = speciesData?.name ?? ""
        classificationLabel.text = speciesData?.classification ?? ""
        designationLabel.text = speciesData?.designation ?? ""
        averageHeightLabel.text = speciesData?.average_height ?? ""
        skinColorsLabel.text = speciesData?.skin_colors ?? ""
        hairColorsLabel.text = speciesData?.hair_colors ?? ""
        eyeColorsLabel.text = speciesData?.eye_colors ?? ""
        averageLifespanLabel.text = speciesData?.average_lifespan ?? ""
        languageLabel.text = speciesData?.language ?? ""
    }

}
