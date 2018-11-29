//
//  Setup.swift
//  TaskManager
//
//  Created by Tanner York on 11/27/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func colorRest() {
        var originalBackgroundColor = UIColor()
        
        SetupValues.shared.backgroundRedValue = 0.14
        SetupValues.shared.backgroundBlueValue = 0.14
        SetupValues.shared.backgroundGreenValue = 0.14
        
        
        originalBackgroundColor = UIColor(red: CGFloat(SetupValues.shared.backgroundRedValue), green: CGFloat(SetupValues.shared.backgroundGreenValue), blue: CGFloat(SetupValues.shared.backgroundBlueValue), alpha: 1.0)
        
       view.backgroundColor = originalBackgroundColor
    }
    
    
    func dateError() {
        let alert = UIAlertController(title: "Data Error", message: "Problem with entered date", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in return}
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
     func taskCreationError() {
        let alert = UIAlertController(title: "Error", message: "Problems setting up task. Make sure all fields are completed.", preferredStyle: .alert)
        let acion = UIAlertAction(title: "Ok", style: .default) { action in return}
        alert.addAction(acion)
        self.present(alert, animated: true)
    }
    
    
}




    

