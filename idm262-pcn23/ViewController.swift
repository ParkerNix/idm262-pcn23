//
//  ViewController.swift
//  idm262-pcn23
//
//  Created by Nix,Parker on 1/26/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var NotifText: UILabel!
    
    @IBOutlet weak var FrequentText: UILabel!
    
    @IBOutlet weak var FrequentOut: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayLabel.textColor = UIColor(named: "Primary")
        displayLabel.text = ""
        NotifText.text = ""
        FrequentText.text = ""
    }
    
    @IBAction func thingPrinter(_ sender: Any) {
        displayLabel.text = "Got it, \(usernameText.text!)!"
    }
    
    // Disable keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func NotifSwitch(_ sender: UISwitch) {
        if (sender.isOn) {
            NotifText.text = "Notifications are now on ;)"
            FrequentOut.isEnabled = true
        } else {
            NotifText.text = "Notifications are now off <3"
            FrequentText.text = ""
            FrequentOut.isEnabled = false
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
}

