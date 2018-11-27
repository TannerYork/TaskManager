//
//  Background:Text Color.swift
//  TaskManager
//
//  Created by Tanner York on 11/26/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
import UIKit



class ViewSetup {
   static let shared = ViewSetup()
    
    var backgroundColor = UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0)
    var textAndButton = UIColor(red:0.38, green:0.45, blue:0.56, alpha:1.0)
    
    func setupView(controller: UIViewController, labels: [UILabel], buttons: [UIButton], backgroundColor: UIColor, textColor: UIColor) {
        controller.view.backgroundColor = backgroundColor
        for label in labels {
            label.textColor = textColor
        }
        for button in buttons {
            button.layer.backgroundColor = textColor as! CGColor
            button.titleLabel?.textColor = backgroundColor
        }
        
    }
    
    
    
}
