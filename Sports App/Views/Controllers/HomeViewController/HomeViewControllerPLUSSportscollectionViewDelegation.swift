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
          let  numberOfItems = sportsPresenter?.sports?.count ?? 0
                print("Items in section: \(sportsPresenter?.sports?.count ?? 0)")
        
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = allSportsCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SportCollectionViewCell.self), for: indexPath) as! SportCollectionViewCell
        
        cell.sportImage.layer.cornerRadius = 15


        
        cell.sportImage.sd_setImage(with: URL(string: sportsPresenter?.sports?[indexPath.row].strSportThumb ?? ""), placeholderImage: UIImage(named: "placeHolder.png"))

        cell.sportName.text = sportsPresenter?.sports?[indexPath.row].strSport

        
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          
            return CGSize(width: (collectionView.frame.width/2.1), height: collectionView.frame.width/1.85)

        }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         selectedSport = indexPath.row
         
        
             performSegue(withIdentifier: "leagues", sender: self)
         
     }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? LeaguesViewController{
            
            destination.sport =  self.sportsPresenter?.sports?[selectedSport!].strSport
            destination.hidesBottomBarWhenPushed = true
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}
