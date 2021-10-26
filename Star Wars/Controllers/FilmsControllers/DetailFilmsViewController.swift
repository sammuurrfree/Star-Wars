//
//  DetailFilmsViewController.swift
//  Star Wars
//
//  Created by Преподаватель on 19.10.2021.
//

import UIKit

class DetailFilmsViewController: UIViewController {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var openingCrawlLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var maxSpeedLabel: UILabel!
    
    
    var filmsData: FilmsModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    

    func loadData() {
        titleLabel.text = filmsData?.title ?? ""
        episodeLabel.text = String(filmsData?.episode_id ?? 0)
        openingCrawlLabel.text = filmsData?.opening_crawl ?? ""
        directorLabel.text = filmsData?.director ?? ""
        producerLabel.text = filmsData?.producer ?? ""
        maxSpeedLabel.text = filmsData?.max_atmosphering_speed ?? ""
    }

}
