//
//  participantsTableViewController.swift
//  SecretSanta
//
//  Created by Abie Gamao on 10/7/15.
//  Copyright (c) 2015 Joenabie M Gamao. All rights reserved.
//

import UIKit

class participantsTableViewController: UITableViewController {
    
    
    var users : [User] = []
    var delegate : ParticipantsDelegate!
    
    var selectedUsers : Set <String> = []
    
    
    @IBAction func doneButton(sender: AnyObject) {
        
        
        for i in self.selectedUsers{
            
            for j in users {
                
                if i == j.firstName{
                    delegate.addParticipants(j)
                }
            
            }
        
        
        }
        self.navigationController?.popViewControllerAnimated(true)
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var user1 = User()
        var user2 = User(alias: "Lovely", firstName: "Nigga", lastName: "What", email: "crazy2mail.com",password: "123", gender: Gender.Female, posts: [])
        users.append(user1)
        users.append(user2)
        users.append(User(alias: "warzon", firstName: "Kromyko", lastName: "Cruzado", email: "lol@yahoo.com",password: "123", gender: Gender.Male, posts: []))

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return users.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("participantsIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        
        cell.textLabel?.text = users[indexPath.row].firstName
            //+ " " + users[indexPath.row].lastName

        return cell
    }
    
    
    
    
    
    
    //SELECTED USERS
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let mySelectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        mySelectedCell.accessoryType = UITableViewCellAccessoryType.Checkmark
        
   
        selectedUsers.insert(users[indexPath.row].firstName)
    
        
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        let mySelectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        
        
        mySelectedCell.accessoryType = UITableViewCellAccessoryType.None
        
        
        //   selectedClasses.remove(theClasses[indexPath])
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
