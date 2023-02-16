//
//  HomeController.swift
//  idm262-pcn23
//
//  Created by Nix,Parker on 2/16/23.
//

import UIKit

class HomeController: UIViewController {
    
    
    @IBOutlet weak var Heystack: UIStackView!
    
    @IBOutlet weak var EntryBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Disable keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func AddEntryButton(_ sender: Any) {
    }
}
