//
//  DetailViewController.swift
//  tableview
//
//  Created by HYEOKBOOK on 28/06/2019.
//  Copyright © 2019 HYEOKBOOK. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var resImg: UIImageView!
    @IBOutlet weak var resName: UILabel!
    @IBOutlet weak var resLocation: UILabel!
    @IBOutlet weak var resType: UILabel!
    
    var getImage : String = ""
    var getName : String = ""
    var getLocation : String = ""
    var getType : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resImg.image = UIImage(named: getImage)
        resName.text = getName
        resType.text = getType
        resLocation.text = getLocation
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
