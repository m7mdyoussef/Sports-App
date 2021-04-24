//
//  RoundedImage.swift
//  Sports App
//
//  Created by Wesam on 4/24/21.
//  Copyright © 2021 mohamed youssef. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

    func makeRounded() {

        self.layer.borderWidth = 4
        self.layer.masksToBounds = false
        self.layer.borderColor = #colorLiteral(red: 0.6999271373, green: 0.6999271373, blue: 0.6999271373, alpha: 1)
        self.layer.cornerRadius = self.frame.height/2.0
        self.clipsToBounds = true
    
    }
}
