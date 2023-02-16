//
//  ViewController.swift
//  idm262-pcn23
//
//  Created by Nix,Parker on 1/26/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    var daCounter:Int = 0
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var ActiveSpin: UIActivityIndicatorView!
    
    @IBOutlet weak var NotifText: UILabel!
    
    @IBOutlet weak var FrequentText: UILabel!
    
    @IBOutlet weak var PopopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayLabel.textColor = UIColor(named: "Primary")
        displayLabel.text = ""
        NotifText.text = ""
        ActiveSpin.startAnimating()
        FrequentText.text = ""
        PopopMenuButton()
    }
    
    @IBAction func thingDoer(_ sender: Any) {
        daCounter += 1
        displayLabel.text = String(daCounter)
    }
    
    @IBAction func thingPrinter(_ sender: Any) {
        displayLabel.text = "Got it, \(usernameText.text!)!"
    }
    
    // Disable keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func ElectricSlide(_ sender: UISlider) {
        displayLabel.text = "slider value do b \(sender.value)"
    }
    
    @IBAction func SpinSwitch(_ sender: UISwitch) {
        ActiveSpin.stopAnimating()
        if (sender.isOn) {
            ActiveSpin.startAnimating()
        }
    }
    
    @IBAction func NotifSwitch(_ sender: UISwitch) {
        if (sender.isOn) {
            NotifText.text = "Notifications are now on ;)"
        } else {
            NotifText.text = "Notifications are now off <3"
        }
    }
    
    @IBAction func FrequentSeg(_ sender: UISegmentedControl) {
        if (sender.titleForSegment(at: sender.selectedSegmentIndex)! == "Once a week") {
            FrequentText.text = "You'll hear from us every week!"
        }
        if (sender.titleForSegment(at: sender.selectedSegmentIndex)! == "Once a day") {
            FrequentText.text = "You'll hear from us once everyday!"
        }
        if (sender.titleForSegment(at: sender.selectedSegmentIndex)! == "Twice a day") {
            FrequentText.text = "You'll hear from us twice everyday!"
        }
    }
    
    func PopopMenuButton() {
        // Build PopopMenuButtons values
        let optionsObj = {
            // (action : UIAction) in print(action.title)
            (action : UIAction) in self.FrequentText.text = action.title
        }
        
        PopopButton.menu = UIMenu(children : [
            UIAction(title: "Yes", state: .on, handler: optionsObj),
            UIAction(title: "No", handler: optionsObj),
            UIAction(title: "Maybe", handler: optionsObj),
            UIAction(title: "I dunno", handler: optionsObj)
        ])
        
        PopopButton.showsMenuAsPrimaryAction = true
        PopopButton.changesSelectionAsPrimaryAction = true
        PopopButton.tintColor = UIColor (named: "Primary")
        FrequentText.text = PopopButton.currentTitle
    }
}

