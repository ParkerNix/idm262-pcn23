//
//  LogTableViewController.swift
//  idm262-pcn23
//
//  Created by Nix,Parker on 3/2/23.
//

import UIKit

class LogTableViewController: UITableViewController {
    
    // Global VARS
    var titles: [String] = ["Today", "Yesterday", "A week ago", "BIRTHDAY!!!", "Almost time...", "yayyyy"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cello", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = titles[indexPath.row]

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete from array.
            titles.remove(at: indexPath.row)
            // Reload from table.
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
            self.titles.append(titleToSave)
            //rebuild table.
            self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Maybe not...", style: .cancel)
        
        alertObj.addTextField()
        alertObj.addAction(saveAction)
        alertObj.addAction(cancelAction)
            
        present(alertObj, animated: true)
    }
    

    // MARK: - Navigation
    
    var selectRowNum:Int = 0
    var selectRowName:String = ""
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectRowNum = indexPath.row
        selectRowName = titles[selectRowNum]
        
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
        }
    }

}
