//
//  WebViewController.swift
//  Sports App
//
//  Created by mohamed youssef on 4/19/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var leaguesWebURl: String = ""

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(leaguesWebURl)

        // Do any additional setup after loading the view.
        if leaguesWebURl != ""{
            let scheme = "https://"
            let url = URL(string: scheme+leaguesWebURl)!
            webView.load(URLRequest(url: url))
        }
       
    }


}
