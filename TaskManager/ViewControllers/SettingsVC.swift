//
//  SettingsVC.swift
//  TaskManager
//
//  Created by Tanner York on 11/26/18.
//  Copyright © 2018 Tanner York. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setSliderValues()
        view.backgroundColor = SetupValues.shared.backgroundColor
    }
    
    //MARK: Properties
    @IBOutlet weak var backgroundRedValueSlider: UISlider!
    @IBOutlet weak var backgroundBlueValueSlider: UISlider!
    @IBOutlet weak var backgroundGreenValueSlider: UISlider!
    
    
    //MARK Actions
    @IBAction func BackgroundRedValue(_ sender: UISlider) {
        SetupValues.shared.backgroundRedValue = Double(sender.value)
        SetupValues.shared.backgroundColor = UIColor(red: CGFloat(SetupValues.shared.backgroundRedValue), green: CGFloat(SetupValues.shared.backgroundGreenValue), blue: CGFloat(SetupValues.shared.backgroundBlueValue), alpha: 1.0)
        view.backgroundColor = SetupValues.shared.backgroundColor
    }
    @IBAction func BackgroundBlueValue(_ sender: UISlider) {
        SetupValues.shared.backgroundBlueValue = Double(sender.value)
        SetupValues.shared.backgroundColor = UIColor(red: CGFloat(SetupValues.shared.backgroundRedValue), green: CGFloat(SetupValues.shared.backgroundGreenValue), blue: CGFloat(SetupValues.shared.backgroundBlueValue), alpha: 1.0)
        view.backgroundColor = SetupValues.shared.backgroundColor
    }
    @IBAction func BackGroundGreenValue(_ sender: UISlider){
        SetupValues.shared.backgroundGreenValue = Double(sender.value)
        SetupValues.shared.backgroundColor = UIColor(red: CGFloat(SetupValues.shared.backgroundRedValue), green: CGFloat(SetupValues.shared.backgroundGreenValue), blue: CGFloat(SetupValues.shared.backgroundBlueValue), alpha: 1.0)
        view.backgroundColor = SetupValues.shared.backgroundColor
    }
    
    
    @IBAction func resetColors(_ sender: Any) {
        setSliderValues()
        SetupValues.shared.backgroundColor = UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0)
        self.colorRest()
    }
    
    @IBAction func cancelChange(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func change(_ sender: Any) {
        self.performSegue(withIdentifier: "unwindToMainVC", sender: self)
    }
    
    
    func setSliderValues() {
        backgroundRedValueSlider.value = 0.67
        backgroundBlueValueSlider.value = 0.62
        backgroundGreenValueSlider.value = 0.62
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! MainVC
        destination.backgroundColor = SetupValues.shared.backgroundColor
    }
    
    
}
