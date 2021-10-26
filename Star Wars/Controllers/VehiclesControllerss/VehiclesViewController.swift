//
//  PeopleViewController.swift
//  Star Wars
//
//  Created by Преподаватель on 15.10.2021.
//

import UIKit

class VehiclesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var vehiclesData: [VehiclesModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPeoples()
    }
    
    
    func loadPeoples(){
        let activity = UIActivityIndicatorView()
        activity.center = view.center
        activity.frame = CGRect(x: activity.frame.midX, y: activity.frame.midY - 150, width: activity.frame.width, height: activity.frame.height)
        activity.startAnimating()
        
        view.addSubview(activity)
        
        DispatchQueue.global(qos: .userInteractive).async { [self] in
            vehiclesData = Vehicles().getAllVehicles()
            DispatchQueue.main.async{
                tableView.reloadData()
                activity.removeFromSuperview()
            }
        }
    }
}


extension VehiclesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vehiclesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = vehiclesData[indexPath.row].name!
        
        return cell
    }
}


extension VehiclesViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailVehiclesViewController") as! DetailVehiclesViewController
        vc.vehiclesData = vehiclesData[indexPath.row]
        
        show(vc, sender: nil)
    }
}
