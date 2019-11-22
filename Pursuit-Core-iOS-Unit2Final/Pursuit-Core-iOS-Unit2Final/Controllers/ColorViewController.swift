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
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet var allLabels: [UILabel]!
    
    @IBOutlet weak var redTextField: UITextField!
    
    @IBOutlet weak var greenTextField: UITextField!
    
    @IBOutlet weak var blueTextField: UITextField!
    
    var color: Crayon?
    var redColor = Float()
    var greenColor = Float()
    var blueColor = Float()
    var alpha: Float = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        resetButton.layer.cornerRadius = 8
        guard let theColor = color else {
            fatalError()
        }
        crayonNameLabel.text = theColor.name
        
        redColor = Float(theColor.red / 255)
        greenColor = Float(theColor.green / 255)
        blueColor = Float(theColor.blue / 255)
        
        theEntireView.backgroundColor = UIColor(displayP3Red: CGFloat(theColor.red / 255), green: CGFloat(theColor.green / 255), blue: CGFloat(theColor.blue / 255), alpha: 1.0)
        
        redLabel.text = "Red: " + String(format: "%.0f", theColor.red)
        greenLabel.text = "Green: " + String(format: "%.0f", theColor.green)
        blueLabel.text = "Blue: " + String(format: "%.0f", theColor.blue)
        
        lightText()
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
    
    func lightText() {
        
        if alpha > 0.4 {
            switch redColor + greenColor + blueColor + alpha {
            case ..<2.0:
                for label in allLabels {
                    label.textColor = .white
                }
            case 2.0...:
                for label in allLabels {
                    label.textColor = .black
                }
            default:
                fatalError()
            }
        } else {
            for label in allLabels {
                label.textColor = .white
            }
        }
    }
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        redLabel.text = "Red: " + String(format: "%.0f", (sender.value * 255))
        theEntireView.backgroundColor = UIColor(displayP3Red: CGFloat(sender.value), green: CGFloat(greenColor), blue: CGFloat(blueColor), alpha: CGFloat(alpha))
        redColor = sender.value
        lightText()
        
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        greenLabel.text = "Green: " + String(format: "%.0f", (sender.value * 255))
        theEntireView.backgroundColor = UIColor(displayP3Red: CGFloat(redColor), green: CGFloat(sender.value), blue: CGFloat(blueColor), alpha: CGFloat(alpha))
        greenColor = sender.value
        lightText()
    }
    
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        blueLabel.text = "Blue: " + String(format: "%.0f", (sender.value * 255))
        theEntireView.backgroundColor = UIColor(displayP3Red: CGFloat(redColor), green: CGFloat(greenColor), blue: CGFloat(sender.value), alpha: CGFloat(alpha))
        blueColor = sender.value
        lightText()
    }
    
    @IBAction func alphaStepperAction(_ sender: UIStepper) {
        alphaStepper.value = sender.value
        alphaLabel.text = "Alpha: " + String(format: "%.1f", sender.value)
        theEntireView.backgroundColor = UIColor(displayP3Red: CGFloat(redColor), green: CGFloat(greenColor), blue: CGFloat(blueColor), alpha: CGFloat(sender.value))
        alpha = Float(sender.value)
        lightText()
        
    }
    
    @IBAction func resetButton(_ sender: UIButton) {
        guard let resetColor = color else {
            fatalError()
        }
        
        theEntireView.backgroundColor = UIColor(displayP3Red: CGFloat(resetColor.red / 255), green: CGFloat(resetColor.green / 255), blue: CGFloat(resetColor.blue / 255), alpha: 1.0)
        
        redLabel.text = "Red: " + String(format: "%.0f", resetColor.red)
        greenLabel.text = "Green: " + String(format: "%.0f", resetColor.green)
        blueLabel.text = "Blue: " + String(format: "%.0f", resetColor.blue)
        alphaLabel.text = "Alpha: 1.0"
        redColor = Float(resetColor.red / 255)
        greenColor = Float(resetColor.green / 255)
        blueColor = Float(resetColor.blue / 255)
        alpha = 1.0
        alphaStepper.value = 1.0
        redSlider.value = redColor
        greenSlider.value = greenColor
        blueSlider.value = blueColor
        lightText()
        
    }
    
}

extension ColorViewController: UITextFieldDelegate {
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {
            fatalError()
        }
        let currentText = text + string
        let validNumbers = ["0","1","2","3","4","5","6","7","8","9"]
        
        if currentText.count > 3 || !validNumbers.contains(string) {
            return false
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var redAsString = String()
        var greenAsString = String()
        var blueAsString = String()
        
        textField.resignFirstResponder()
        
        if textField == redTextField {
            redAsString = redTextField.text ?? "255"
            redColor = Float(redAsString)! / 255
            if !redAsString.isEmpty && redColor <= 1.0 {
                theEntireView.backgroundColor = UIColor(displayP3Red: CGFloat(redColor), green: CGFloat(greenColor), blue: CGFloat(blueColor), alpha: CGFloat(alpha))
                redLabel.text = "Red: " + String(format: "%.0f", (redColor * 255))
                redSlider.value = redColor
                lightText()
                textField.text = ""
            }
            
        } else if textField == greenTextField {
            greenAsString = greenTextField.text ?? "255"
            greenColor = Float(greenAsString)! / 255
            if !greenAsString.isEmpty && greenColor <= 1.0 {
                theEntireView.backgroundColor = UIColor(displayP3Red: CGFloat(redColor), green: CGFloat(greenColor), blue: CGFloat(blueColor), alpha: CGFloat(alpha))
                greenLabel.text = "Green: " + String(format: "%.0f", (greenColor * 255))
                greenSlider.value = greenColor
                lightText()
            }
            
        } else if textField == blueTextField {
            blueAsString = blueTextField.text ?? "255"
            blueColor = Float(blueAsString)! / 255
            if !blueAsString.isEmpty && blueColor <= 1.0 {
                theEntireView.backgroundColor = UIColor(displayP3Red: CGFloat(redColor), green: CGFloat(greenColor), blue: CGFloat(blueColor), alpha: CGFloat(alpha))
                blueLabel.text = "Blue: " + String(format: "%.0f", (blueColor * 255))
                blueSlider.value = blueColor
                lightText()
            }
            
        }
        textField.text = ""
        return true
    }
}


