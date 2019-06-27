//
//  ViewController.swift
//  tableview
//
//  Created by HYEOKBOOK on 28/06/2019.
//  Copyright © 2019 HYEOKBOOK. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableVw: UITableView!
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantIsVisited = Array(repeating: false, count: 21)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVw.delegate = self
        tableVw.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail"{
            if let indexPath = tableVw.indexPathForSelectedRow{
                let destinationVC = segue.destination as! DetailViewController
                destinationVC.getName = restaurantNames[indexPath.row]
                destinationVC.getType = restaurantTypes[indexPath.row]
                destinationVC.getLocation = restaurantLocations[indexPath.row]
                destinationVC.getImage = restaurantImages[indexPath.row]
            }
        }
    }
}


extension ViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVw.dequeueReusableCell(withIdentifier: "cell01", for: indexPath) as! DetailTableViewCell
        cell.resLocation.text = restaurantLocations[indexPath.row]
        cell.resType.text = restaurantTypes[indexPath.row]
        cell.resName.text = restaurantNames[indexPath.row]
        cell.resImg.image = UIImage(named: restaurantImages[indexPath.row])
        cell.heartImg.isHidden = restaurantIsVisited[indexPath.row] ? false : true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAct = UIContextualAction(style: .destructive, title: "삭제") { (action, sourceview, handler) in
            handler(true)
        }
        let shareAct = UIContextualAction(style: .normal, title: "공유") { (action, sourceview, handler) in
            handler(true)
        }
        
        deleteAct.backgroundColor = .red
        shareAct.backgroundColor = .blue
        deleteAct.image = UIImage(named: "baseline_delete_forever_black_36pt")
        shareAct.image = UIImage(named: "baseline_share_black_36pt")
        
        let swipeVC = UISwipeActionsConfiguration(actions: [deleteAct,shareAct])
        return swipeVC
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let checkAct = UIContextualAction(style: .normal, title: "확인") { (action, sourceview, handler) in
            let cell = tableView.cellForRow(at: indexPath) as! DetailTableViewCell
            self.restaurantIsVisited[indexPath.row] = (self.restaurantIsVisited[indexPath.row]) ? false:true
            cell.heartImg.isHidden = self.restaurantIsVisited[indexPath.row] ? false:true
            
            handler(true)
        }
        
        let checkIcon = self.restaurantIsVisited[indexPath.row] ? "undo" : "tick"
        checkAct.backgroundColor = .green
        checkAct.image = UIImage(named: checkIcon)
        
        let swipeVC = UISwipeActionsConfiguration(actions: [checkAct])
        return swipeVC
    }
}
