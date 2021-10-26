//
//  PeopleViewController.swift
//  Star Wars
//
//  Created by Преподаватель on 15.10.2021.
//

import UIKit

class StarshipsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var starshipsData: [StarshipsModel] = []
    
    
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
            starshipsData = Starships().getAllStarships()
            DispatchQueue.main.async{
                tableView.reloadData()
                activity.removeFromSuperview()
            }
        }
    }
}


extension StarshipsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        starshipsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = starshipsData[indexPath.row].name!
        
        return cell
    }
}


extension StarshipsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "detailStarshipsViewController") as! DetailStarshipsViewController
        vc.starshipsData = starshipsData[indexPath.row]
        
        show(vc, sender: nil)
    }
}
