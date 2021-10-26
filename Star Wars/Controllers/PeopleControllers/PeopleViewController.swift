//
//  PeopleViewController.swift
//  Star Wars
//
//  Created by Преподаватель on 15.10.2021.
//

import UIKit

class PeopleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var peoplesData: [PeopleModel] = []
    
    
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
            peoplesData = People().getAllPeople()
            DispatchQueue.main.async{
                tableView.reloadData()
                activity.removeFromSuperview()
            }
        }
    }
}


extension PeopleViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        peoplesData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = peoplesData[indexPath.row].name!
        
        return cell
    }
}


extension PeopleViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailPeopleViewController") as! DetailPeopleViewController
        vc.peopleData = peoplesData[indexPath.row]
        
        show(vc, sender: nil)
    }
}
