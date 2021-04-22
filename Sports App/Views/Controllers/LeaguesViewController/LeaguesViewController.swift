//
//  LeaguesViewController.swift
//  Sports App
//
//  Created by mohamed youssef on 4/19/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import UIKit

class LeaguesViewController: UIViewController, UITableViewDelegate ,UITableViewDataSource {

    var sport : String?
    var leaguePresenter : LeaguesPresenter?
    var activityIndicator: UIActivityIndicatorView!
    var selectedLeagues : Int?
    
    @IBOutlet weak var leaguesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator = UIActivityIndicatorView(style: .large)
        
        leaguePresenter = LeaguesPresenter(view: self, sportName: sport)
        leaguePresenter?.getLeagues()
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaguePresenter?.leagues?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("inside cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilteredLeagueCell", for: indexPath) as! FilteredLeagueViewTableViewCell
        
        cell.filteredLeagueName.text = leaguePresenter?.leagues?[indexPath.row].leaguesName
        
        
        cell.filteredLeagueImage.sd_setImage(with: URL(string: leaguePresenter?.leagues?[indexPath.row].leaguesImage ?? ""), placeholderImage: UIImage(named: "placeHolder.png"))

        if(leaguePresenter?.leagues?[indexPath.row].youtube != ""){
            cell.filteredYoutubeImage.isHidden = false
        }
       
        cell.yotubeButton = {
            print("youtube button index\(indexPath.row)")
            self.selectedLeagues = indexPath.row
            self.performSegue(withIdentifier: "webView", sender: self)
            
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row index \(indexPath.row)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? WebViewController{
            
            destination.leaguesWebURl =  self.leaguePresenter?.leagues?[selectedLeagues!].youtube ?? ""
        }
    }

    func showErreorMessage() {
        
        let alert = UIAlertController(title: "Error", message: leaguePresenter?.error, preferredStyle: .alert)
        
        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in
            
            
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}


