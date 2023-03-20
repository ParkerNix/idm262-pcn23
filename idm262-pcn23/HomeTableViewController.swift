//
//  HomeTableViewController.swift
//  idm262-pcn23
//
//  Created by Nix,Parker on 3/20/23.
//

import UIKit
import CoreData

class HomeTableViewController: UITableViewController {
    //link log core data to logObj
    var logObj: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
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
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // return titles.count
        return logObj.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cello", for: indexPath) as! CelloTableViewCell

        // Configure the cell...
        //cell.textLabel?.text = titles[indexPath.row]
        
        // cell.titleLabel.text = titles[indexPath.row]
        
        let thisRow = logObj[indexPath.row]
        
        cell.titleLabel?.text = thisRow.value(forKey: "title") as? String

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let oneTitle = logObj[indexPath.row]
            
            context.delete(oneTitle)
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                logObj = try context.fetch(Logs.fetchRequest())
                print("title fetch done" + String(logObj.count))
            } catch {
                print("wrong")
            }
            tableView.reloadData()
        } /* else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        } */
    }
           

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    @IBAction func addLogFunction(_ sender: Any) {
        //Create alert to get new log from user
        let alertObj = UIAlertController(title: "New log time!", message: "Add new log title", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save!", style: .default) {
            [unowned self] action in
            guard let textfield = alertObj.textFields?.first,
                  let titleToSave = textfield.text else {
                return
            }
            
            //update array.
            // self.titles.append(titleToSave)
            self.saveToCore(title: titleToSave)
            //rebuild table.
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Maybe not...", style: .cancel)
        
        alertObj.addTextField()
        alertObj.addAction(saveAction)
        alertObj.addAction(cancelAction)
            
        present(alertObj, animated: true)
    }
    
    func saveToCore (title: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContent = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Logs", in: managedContent)!
        
        let log = NSManagedObject(entity: entity, insertInto: managedContent)
        
        // target ONE person in entity
        log.setValue(title, forKey: "title")
        
        do {
            try managedContent.save()
            logObj.append(log)
        } catch let error as NSError{
            print("ya no, \(error), \(error.userInfo)")
        }
    }
    

    // MARK: - Navigation
    
    var selectRowNum:Int = 0
    var selectRowName:String = ""
    var selectRowText:String = ""
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectRowNum = indexPath.row
        let thisRow = logObj[selectRowNum]
        selectRowName = (thisRow.value(forKey: "title") as? String)!
        selectRowText = (thisRow.value(forKey: "text") as? String)!
        
        // Go!
        performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showDetail" {
            let detailObj = segue.destination as! DetailViewController
            detailObj.indexNum = selectRowNum
            detailObj.indexTitle = selectRowName
            detailObj.indexText = selectRowText
        }
    }

}
