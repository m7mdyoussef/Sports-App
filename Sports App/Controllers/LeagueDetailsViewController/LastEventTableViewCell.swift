//
//  LastEventTableViewCell.swift
//  Sports App
//
//  Created by Wesam on 4/20/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import UIKit

class LastEventTableViewCell: UITableViewCell {

    @IBOutlet weak var firstteamImage: UIImageView!
    
    @IBOutlet weak var firstTeamScore: UILabel!
    
    @IBOutlet weak var firstTeamName: UILabel!
    
    @IBOutlet weak var secondTeamImage: UIImageView!
    
    @IBOutlet weak var secondteamName: UILabel!
    
    @IBOutlet weak var secondTeamScore: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
