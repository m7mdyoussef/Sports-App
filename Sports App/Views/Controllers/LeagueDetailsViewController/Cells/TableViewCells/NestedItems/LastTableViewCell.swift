//
//  LastTableViewCell.swift
//  Sports App
//
//  Created by mohamed youssef on 4/23/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import UIKit

class LastTableViewCell: UITableViewCell {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var secondNameLabel: UILabel!
    
    @IBOutlet weak var firstScoreLabel: UILabel!
    @IBOutlet weak var secondScoreLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
