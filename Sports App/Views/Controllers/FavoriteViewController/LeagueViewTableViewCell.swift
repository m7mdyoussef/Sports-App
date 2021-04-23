//
//  LeagueViewTableViewCell.swift
//  Sports App
//
//  Created by Wesam on 4/20/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import UIKit

class LeagueViewTableViewCell: UITableViewCell {

    @IBOutlet weak var leagueImage: UIImageView!
    
    @IBOutlet weak var leagueName: UILabel!
    
    
    @IBOutlet weak var youtubeImage: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func youtubeImageClicked(_ sender: Any) {
    }
}
