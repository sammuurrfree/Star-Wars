//
//  PlanetsViewController.swift
//  Star Wars
//
//  Created by Преподаватель on 19.10.2021.
//

import UIKit


class PlanetsViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var planetsData: [PlanetsModel] = []
    
    
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
            planetsData = Planets().getAllPlanets()
            DispatchQueue.main.async{
                tableView.reloadData()
                activity.removeFromSuperview()
            }
        }
    }
}


extension PlanetsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        planetsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = planetsData[indexPath.row].name!
        
        return cell
    }
}


extension PlanetsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailPlanetsViewController") as! DetailPlanetsViewController
        vc.planetsData = planetsData[indexPath.row]
        
        show(vc, sender: nil)
    }
}
