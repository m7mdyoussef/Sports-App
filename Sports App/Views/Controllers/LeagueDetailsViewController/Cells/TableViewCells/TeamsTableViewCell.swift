//
//  TeamsTableViewCell.swift
//  Sports App
//
//  Created by mohamed youssef on 4/23/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import UIKit
import SDWebImage

class TeamsTableViewCell: UITableViewCell {
    
    var didSelectItemAtIndexPath : ((IndexPath) -> Void)?
    
    var leagueTeamsDetails = [Team](){
        didSet{
            DispatchQueue.main.async {
                self.teamCollectionView.reloadData()
            }
        }
        
    }
    
    
    @IBOutlet weak var teamCollectionView: UICollectionView!{
        
        didSet{
            teamCollectionView.delegate = self
            teamCollectionView.dataSource = self
        }
        
    }
    

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


extension TeamsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return leagueTeamsDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        

        
        guard  let cell = teamCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TeamCollectionViewCell.self), for: indexPath)  as? TeamCollectionViewCell else {
            
            return UICollectionViewCell()
        }
        
        cell.teamImageView.sd_setImage(with: URL(string: leagueTeamsDetails[indexPath.row].strTeamBadge ?? ""), placeholderImage: UIImage(named: "placeHolder.png"))
        
       
        
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

            return CGSize(width: (collectionView.frame.width/2.2), height: collectionView.frame.width/1.85)
    }
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItemAtIndexPath?(indexPath)
            
    }
}


