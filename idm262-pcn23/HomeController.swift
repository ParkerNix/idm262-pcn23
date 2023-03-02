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
    
    @IBOutlet weak var titleBox: UITextField!
    
    @IBOutlet weak var textBox: UITextView!
    
    @IBOutlet weak var Heystack: UIStackView!
    
    @IBOutlet weak var printView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let WatashiNoOto = Bundle.main.path(forResource: "sounds/twinklePark", ofType: "mp3")
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
        if audiopuraiya.isPlaying {
            audiopuraiya.stop()
            print("that's all folks")
        } else {
            audiopuraiya.play()
            print("TURN IT UP")
        }
    }

}
