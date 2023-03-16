//
//  DetailViewController.swift
//  idm262-pcn23
//
//  Created by Nix,Parker on 3/2/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    // Set up vars for segue.
    var indexNum:Int?
    var indexTitle:String?
    var indexText:String?
    
    @IBOutlet weak var titlePlace: UILabel!
    
    @IBOutlet weak var textPlace: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titlePlace.text = indexTitle
        textPlace.text = indexText

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

