//
//  HomeViewController.swift
//  Sports App
//
//  Created by mohamed youssef on 4/19/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import UIKit
import Reachability

class HomeViewController: UIViewController , SportsView { //// 2.1  1 -> 0

    
    let reachability = try! Reachability()
    var indicator : ShowIndecator?
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
        
        if reachability.connection == .cellular || reachability.connection == .wifi{
            DesignedBGView.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
            sportsPresenter?.getSports()  ////  5  1 -> 0    set  prop.self  + as btn clicked to call this method
        }
        
    
       
        allSportsCollectionView.layer.cornerRadius = 20
        indicator = ShowIndecator(view: allSportsCollectionView)
        
              do{
                  try reachability.startNotifier()

              }catch{
                  print("Connection Error")
              }
    }
    
    func reloadData() {  //// 2.2  1 -> 0
        DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
        self.allSportsCollectionView.reloadData()
       })
    }
    
    func startAnimating() {  //// 2.2  1 -> 0
        print("start animation")
        DispatchQueue.main.asyncAfter(deadline: .now()) {
        self.indicator?.startAnimating()
        }
    }
    
     
          
        func stopAnimating() {  //// 2.2  1 -> 0
            print("stop animation")
            DispatchQueue.main.async {
            self.indicator?.stopAnimating()
            }
        
    }
}
