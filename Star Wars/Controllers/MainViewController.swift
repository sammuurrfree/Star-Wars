//
//  MainViewController.swift
//  Star Wars
//
//  Created by Преподаватель on 14.10.2021.
//

import UIKit

class MainViewController: UIViewController {

    let category = ["Films", "People", "Planets", "Species", "Starships", "Vehicles"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}


extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = category[indexPath.row]
        
        return cell
    }
}


extension MainViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc: UIViewController
        
        switch indexPath.row {
        case 0:
            vc = storyboard!.instantiateViewController(withIdentifier: "filmsViewController")
        case 1:
            vc = storyboard!.instantiateViewController(withIdentifier: "peopleViewController")
        case 2:
            vc = storyboard!.instantiateViewController(withIdentifier: "planetsViewController")
        case 3:
            vc = storyboard!.instantiateViewController(withIdentifier: "speciesViewController")
        case 4:
            vc = storyboard!.instantiateViewController(withIdentifier: "starshipsViewController")
        case 5:
            vc = storyboard!.instantiateViewController(withIdentifier: "vehiclesViewController")
        default:
            vc = storyboard!.instantiateViewController(withIdentifier: "peopleViewControlles")
        }
        
        show(vc, sender: nil)
    }
    
}
