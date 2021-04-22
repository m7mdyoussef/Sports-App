//
//  HomeViewControllerPLUSSportscollectionViewDelegation.swift
//  Sports App
//
//  Created by mohamed youssef on 4/21/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import UIKit
import SDWebImage
import Reachability

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var numberOfItems = 0
        if reachability.connection == .unavailable{
            numberOfItems = 1
        }else{
            numberOfItems = sportsPresenter?.sports?.count ?? 0
        }
        return numberOfItems
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = allSportsCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SportCollectionViewCell.self), for: indexPath) as! SportCollectionViewCell
        
        cell.sportImage.layer.cornerRadius = 15

        if reachability.connection == .unavailable{
            DesignedBGView.isHidden = true
            
            cell.sportImage.image = UIImage(named: "noInternet")
            cell.sportImage.contentMode = .scaleToFill
            cell.sportName.text = "No Internet Connection!"
            cell.sportName.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
//            cell.sportNameLabel.font = UIFont(name: "", size: collectionView.frame.width*0.07)
        }else{
            cell.sportImage.sd_setImage(with: URL(string: sportsPresenter?.sports?[indexPath.row].strSportThumb ?? ""), placeholderImage: UIImage(named: "placeHolder.png"))
            cell.sportName.text = sportsPresenter?.sports?[indexPath.row].strSport
        }

        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          
            if reachability.connection == .unavailable{
                return CGSize(width: (collectionView.frame.width), height: collectionView.frame.height)
            }else{
                return CGSize(width: (collectionView.frame.width/2.1), height: collectionView.frame.width/1.85)
            }
        }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         selectedSport = indexPath.row
         
        if reachability.connection == .cellular || reachability.connection == .wifi{
                  performSegue(withIdentifier: "leagues", sender: self)
              }
        
         
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LeaguesViewController{
            
            destination.sport =  self.sportsPresenter?.sports?[selectedSport!].strSport
            destination.hidesBottomBarWhenPushed = true
        }
    }
    
    
    
}
