//
//  ColorViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Kelby Mittan on 11/22/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet weak var crayonNameLabel: UILabel!
    @IBOutlet var theEntireView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var alphaLabel: UILabel!
    
    var color: Crayon?
    
    var redColor = Float()
    
    var greenColor = Float()
    
    var blueColor = Float()
    
    var alpha: Float = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guard let theColor = color else {
            fatalError()
        }
        crayonNameLabel.text = theColor.name
        
        redColor = Float(theColor.red / 255)
        greenColor = Float(theColor.green / 255)
        blueColor = Float(theColor.blue / 255)
        
        theEntireView.backgroundColor = UIColor(displayP3Red: CGFloat(theColor.red / 255), green: CGFloat(theColor.green / 255), blue: CGFloat(theColor.blue / 255), alpha: 1.0)
        
        redLabel.text = "Red: \((Double(theColor.red) / 255).description)"
        greenLabel.text = "Green: \((Double(theColor.green) / 255).description)"
        blueLabel.text = "Blue: \((Double(theColor.blue) / 255).description)"
        
        configureSliders()
        configureStepper()

    }
    
    func configureSliders() {
        
        guard let theColor = color else {
            fatalError()
        }
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1.0
        redSlider.value = Float(theColor.red / 255)
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1.0
        greenSlider.value = Float(theColor.green / 255)
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1.0
        blueSlider.value = Float(theColor.blue / 255)
    }
    
    func configureStepper() {
        alphaStepper.minimumValue = 0
        alphaStepper.maximumValue = 1.0
        alphaStepper.stepValue = 0.1
        
        alphaStepper.value = 1.0
    }
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        redLabel.text = "Red: \((Double(sender.value)).description)"
        theEntireView.backgroundColor = UIColor(displayP3Red: CGFloat(sender.value), green: CGFloat(greenColor), blue: CGFloat(blueColor), alpha: CGFloat(alpha))
        redColor = sender.value
        
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        greenLabel.text = "Green: \((Double(sender.value)).description)"
        theEntireView.backgroundColor = UIColor(displayP3Red: CGFloat(redColor), green: CGFloat(sender.value), blue: CGFloat(blueColor), alpha: CGFloat(alpha))
        greenColor = sender.value
    }
    
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        blueLabel.text = "Blue: \((Double(sender.value)).description)"
        theEntireView.backgroundColor = UIColor(displayP3Red: CGFloat(redColor), green: CGFloat(greenColor), blue: CGFloat(sender.value), alpha: CGFloat(alpha))
        blueColor = sender.value
    }
    
    @IBAction func alphaStepperAction(_ sender: UIStepper) {
        alphaStepper.value = sender.value
        alphaLabel.text = sender.value.description
        alpha = Float(sender.value)
        
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        
        
    }
    
}


