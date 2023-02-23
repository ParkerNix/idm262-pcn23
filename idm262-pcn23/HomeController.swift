//
//  HomeController.swift
//  idm262-pcn23
//
//  Created by Nix,Parker on 2/16/23.
//

import UIKit
import AVFoundation

var audiopuraiya = AVAudioPlayer()

class HomeController: UIViewController {
    
    
    @IBOutlet weak var Heystack: UIStackView!
    
    @IBOutlet weak var EntryBox: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let WatashiNoOto = Bundle.main.path(forResource: "sounds/halo1", ofType: "mp3")
        do {
            audiopuraiya = try
            AVAudioPlayer(contentsOf: URL(fileURLWithPath: WatashiNoOto!))
            audiopuraiya.prepareToPlay()
            print("omg the sound loaded yay")
        } catch {
            print(error)
        }
    }

    // Disable keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func AddEntryButton(_ sender: Any) {
        print("yo")
        if audiopuraiya.isPlaying {
            audiopuraiya.stop()
            print("that's all folks")
        } else {
            audiopuraiya.play()
            print("TURN IT UP")
        }
    }
    
    @IBAction func lifealert(_ sender: Any) {
        let lifeAlert = UIAlertController(title: "HELP!", message: "I've fallen and I can't get up!", preferredStyle: .alert)
        
        lifeAlert.view.tintColor = UIColor(named: "Primary")
        
        lifeAlert.addAction(UIAlertAction(title: "Leave", style: .cancel, handler: {
            (UIAction) in
            print("you have left the elderly woman")
        }))
        
        lifeAlert.addAction(UIAlertAction(title: "Call 911", style: .default, handler: {
            (UIAlertAction) in
            print("Don't worry ma'am, we're on our way")
        }))
        
        self.present(lifeAlert, animated: true)
    }
}
