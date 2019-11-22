//
//  ColorViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Kelby Mittan on 11/22/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet var theEntireView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var alphaLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func configureRedSlider() {
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1.0
        redSlider.value = 17
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
        
        
    }
    
}


//A background color that starts as the same color as the selected Crayon.
//A UILabel to show the name of the selected Crayon
//A UISlider and UILabel that represent the current red value
//A UISlider and UILabel that represent the current green value
//A UISlider and UILabel that represent the current blue value
//A UIStepper and UILabel that represents the current alpha
//A reset UIButton that sets all the sliders and labels to be the corresponding colors of the Crayon the user selected and resets the alpha to 1.0.
