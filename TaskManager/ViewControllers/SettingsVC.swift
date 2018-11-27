//
//  SettingsVC.swift
//  TaskManager
//
//  Created by Tanner York on 11/26/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    var newBackgroundColor: UIColor = UIColor(red:0.67, green:0.62, blue:0.62, alpha:1.0)
    
    var backgroundRedValue: Float = 0.67
    var backgroundBlueValue: Float = 0.62
    var backgroundGreenValue: Float = 0.62
    
    var newButtonsColor: UIColor = UIColor(red:0.22, green:0.25, blue:0.32, alpha:1.0)
    
    var buttonsRedValue: Float = 0.22
    var buttonsBlueValue: Float = 0.25
    var buttonsGreenValue: Float = 0.32
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //MARK: Properties
    @IBOutlet weak var buttonRedValueSlider: UISlider!
    @IBOutlet weak var buttonBlueValueSlider: UISlider!
    @IBOutlet weak var buttonGreenValueSlider: UISlider!
    @IBOutlet weak var backgroundRedValueSlider: UISlider!
    @IBOutlet weak var backgroundBlueValueSlider: UISlider!
    @IBOutlet weak var backgroundGreenValueSlider: UISlider!
    
    
    
    
    
    //MARK Actions
    
    @IBAction func ButtonsRedValue(_ sender: UISlider) {
        buttonsRedValue = sender.value
        newButtonsColor = UIColor(red: CGFloat(buttonsRedValue), green: CGFloat(buttonsGreenValue), blue: CGFloat(buttonsBlueValue), alpha: 1.0)
        
    }
    @IBAction func ButtonsBlueValue(_ sender: UISlider) {
        buttonsGreenValue = sender.value
        newButtonsColor = UIColor(red: CGFloat(buttonsRedValue), green: CGFloat(buttonsGreenValue), blue: CGFloat(buttonsBlueValue), alpha: 1.0)
    }
    @IBAction func ButtonsGreenValue(_ sender: UISlider) {
        buttonsGreenValue = sender.value
        newButtonsColor = UIColor(red: CGFloat(buttonsRedValue), green: CGFloat(buttonsGreenValue), blue: CGFloat(buttonsBlueValue), alpha: 1.0)
    }
    
    
    @IBAction func BackgroundRedValue(_ sender: UISlider) {
        backgroundRedValue = sender.value
        newBackgroundColor = UIColor(red: CGFloat(backgroundRedValue), green: CGFloat(backgroundGreenValue), blue: CGFloat(backgroundBlueValue), alpha: 1.0)
        view.backgroundColor = newBackgroundColor
    }
    @IBAction func BackgroundBlueValue(_ sender: UISlider) {
        backgroundBlueValue = sender.value
        newBackgroundColor = UIColor(red: CGFloat(backgroundRedValue), green: CGFloat(backgroundGreenValue), blue: CGFloat(backgroundBlueValue), alpha: 1.0)
        view.backgroundColor = newBackgroundColor
    }
    @IBAction func BackGroundGreenValue(_ sender: UISlider){
        backgroundGreenValue = sender.value
        newBackgroundColor = UIColor(red: CGFloat(backgroundRedValue), green: CGFloat(backgroundGreenValue), blue: CGFloat(backgroundBlueValue), alpha: 1.0)
        view.backgroundColor = newBackgroundColor
    }
    
    
    @IBAction func resetColors(_ sender: Any) {
        
        backgroundRedValue = 0.67
        backgroundBlueValue = 0.62
        backgroundGreenValue = 0.62
        
        buttonsRedValue  = 0.22
        buttonsBlueValue  = 0.25
        buttonsGreenValue = 0.32
        
        backgroundRedValueSlider.value = 0.67
        backgroundBlueValueSlider.value = 0.62
        backgroundGreenValueSlider.value = 0.62
        
        buttonRedValueSlider.value = 0.22
        buttonBlueValueSlider.value = 0.25
        buttonGreenValueSlider.value = 0.32
        
        newBackgroundColor = UIColor(red: CGFloat(backgroundRedValue), green: CGFloat(backgroundGreenValue), blue: CGFloat(backgroundBlueValue), alpha: 1.0)
        newButtonsColor = UIColor(red: CGFloat(buttonsRedValue), green: CGFloat(buttonsGreenValue), blue: CGFloat(buttonsBlueValue), alpha: 1.0)
        
        view.backgroundColor = newBackgroundColor
        
        
    }
}
