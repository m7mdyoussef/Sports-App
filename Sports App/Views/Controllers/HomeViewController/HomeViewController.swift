//
//  HomeViewController.swift
//  Sports App
//
//  Created by mohamed youssef on 4/19/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , SportsView { //// 2.1  1 -> 0

    

    var sportsPresenter : SportsViewPresenter?
    var selectedSport : Int?
    
    @IBOutlet weak var allSportsCollectionView: UICollectionView!{
        didSet{
            // collection view delegates
            allSportsCollectionView.delegate = self
            allSportsCollectionView.dataSource = self
            
        }
    }
    @IBOutlet weak var DesignedBGView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sportsPresenter = SportsPresenter(view: self)  ////  5  1 -> 0    set  prop.self
        sportsPresenter?.getSports()  ////  5  1 -> 0    set  prop.self  + as btn clicked to call this method
       
        allSportsCollectionView.layer.cornerRadius = 20
    }
    
    func reloadData() {  //// 2.2  1 -> 0
             DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
               self.allSportsCollectionView.reloadData()
           })
    }
    
    func startAnimating() {  //// 2.2  1 -> 0
        print("start animation")
    }
    
    func stopAnimating() {  //// 2.2  1 -> 0
          print("stop animation")
    }
}
