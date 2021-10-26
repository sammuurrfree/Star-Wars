//
//  DetailPeopleViewController.swift
//  Star Wars
//
//  Created by Преподаватель on 15.10.2021.
//

import UIKit

class DetailPeopleViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var skinLabel: UILabel!
    
    var peopleData: PeopleModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    

    func loadData() {
        nameLabel.text = peopleData?.name ?? ""
        eyeColorLabel.text = peopleData?.eye_color ?? ""
        genderLabel.text = peopleData?.gender ?? ""
        hairColorLabel.text = peopleData?.hair_color ?? ""
        massLabel.text = peopleData?.mass ?? ""
        skinLabel.text = peopleData?.skin_color ?? ""
    }

}
