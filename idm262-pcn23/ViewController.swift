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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayLabel.textColor = UIColor(named: "Primary")
    }
    
    @IBAction func thingDoer(_ sender: Any) {
        daCounter += 1
        displayLabel.text = String(daCounter)
    }
    
    @IBAction func thingPrinter(_ sender: Any) {
        displayLabel.text = "Welcome, \(usernameText.text!)!"
    }
    
    // Disable keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

