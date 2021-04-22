//
//  FilteredLeagueViewTableViewCell.swift
//  Sports App
//
//  Created by Wesam on 4/20/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import UIKit

class FilteredLeagueViewTableViewCell: UITableViewCell {

    @IBOutlet weak var filteredLeagueImage: UIImageView!
    
    @IBOutlet weak var filteredYoutubeImage: UIButton!
    @IBOutlet weak var filteredLeagueName: UILabel!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func filteredYoutubeImageClicked(_ sender: Any) {
     
    }
}
