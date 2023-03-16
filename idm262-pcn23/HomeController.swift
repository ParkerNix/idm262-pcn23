//
//  HomeController.swift
//  idm262-pcn23
//
//  Created by Nix,Parker on 2/16/23.
//

import UIKit
import AVFoundation
import CoreData

var audiopuraiya = AVAudioPlayer()

class HomeController: UIViewController {
    
    //link log core data to logObj
    var logObj: [NSManagedObject] = []
    
    @IBOutlet weak var titleBox: UITextField!
    
    @IBOutlet weak var textBox: UITextView!
    
    @IBOutlet weak var Heystack: UIStackView!
    
    @IBOutlet weak var printView: UIStackView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContent = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Logs")
        
        do {
            logObj = try managedContent.fetch(fetchRequest)
        } catch let error as NSError {
            print("Nope cause \(error), \(error.userInfo)")
        }
    }
    
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
        
        let titleToSave:String = titleBox.text!
        let textToSave:String = textBox.text!
        
        //update array.
        // self.titles.append(titleToSave)
        self.saveToCore(title: titleToSave, text: textToSave)
    }
    
    func saveToCore (title: String, text: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContent = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Logs", in: managedContent)!
        
        let log = NSManagedObject(entity: entity, insertInto: managedContent)
        
        // target ONE person in entity
        log.setValue(title, forKey: "title")
        log.setValue(text, forKey: "text")
        
        do {
            try managedContent.save()
            logObj.append(log)
            print("it did it.")
            titleBox.text = ""
            textBox.text = ""
        } catch let error as NSError{
            print("ya no, \(error), \(error.userInfo)")
        }
    }

}
