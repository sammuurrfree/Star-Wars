//
//  SpeciesViewController.swift
//  Star Wars
//
//  Created by Преподаватель on 19.10.2021.
//

import UIKit


class SpeciesViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var speciesData: [SpeciesModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        loadPeoples()
    }
    
    
    func loadPeoples(){
        let activity = UIActivityIndicatorView()
        activity.center = view.center
        activity.frame = CGRect(x: activity.frame.midX, y: activity.frame.midY - 150, width: activity.frame.width, height: activity.frame.height)
        activity.startAnimating()
        
        view.addSubview(activity)
        
        DispatchQueue.global(qos: .userInteractive).async { [self] in
            speciesData = Species().getAllSpecies()
            DispatchQueue.main.async{
                tableView.reloadData()
                activity.removeFromSuperview()
            }
        }
    }
}


extension SpeciesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        speciesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = speciesData[indexPath.row].name!
        
        return cell
    }
}


extension SpeciesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailSpeciesViewController") as! DetailSpeciesViewController
        vc.speciesData = speciesData[indexPath.row]
        
        show(vc, sender: nil)
    }
}
