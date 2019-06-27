//
//  DetailTableViewCell.swift
//  tableview
//
//  Created by HYEOKBOOK on 28/06/2019.
//  Copyright © 2019 HYEOKBOOK. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var resName: UILabel!
    
    @IBOutlet weak var resLocation: UILabel!
    
    @IBOutlet weak var resType: UILabel!
    @IBOutlet weak var resImg: UIImageView!{
        didSet{
            resImg.layer.cornerRadius = resImg.bounds.width / 2
            resImg.clipsToBounds = true
        }
    }
    @IBOutlet weak var heartImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
