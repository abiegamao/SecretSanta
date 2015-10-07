//
//  EventsTableViewController.swift
//  SecretSanta
//
//  Created by Joenabie M Gamao on 10/2/15.
//  Copyright (c) 2015 Joenabie M Gamao. All rights reserved.
//

import UIKit




protocol EventDelegate{


    func addEvent(event: Event)
    func editEvent()
    
}

class EventsTableViewController: UITableViewController, EventDelegate {
    
    
    var events : [Event] = []
    
    
    
    
    // DELEGATE FUNCTION
    
    func addEvent(event: Event) {
        self.events.append(event)
        self.tableView.reloadData()
    }
    
    func editEvent() {
       /* if let path = self.tableView.indexPathForSelectedRow(){
            events[path.row] = event
            tableView.reloadData()
        }*/
        tableView.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var event1 = Event()
        
        events.append(event1)

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
        return events.count
    }

    /// LOAD VALUEs
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("eventsIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        cell.textLabel?.text = events[indexPath.row].title
        cell.detailTextLabel?.text = events[indexPath.row].eventDate
        

        return cell
    }
    
    
    //DELETE
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            if editingStyle == .Delete {
                events.removeAtIndex(indexPath.row)
                // Delete the row from the data source
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                
            } else if editingStyle == .Insert {
                // NSThread.sleepForTimeInterval(2)
                // tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Bottom)
                // println("edit insert")
                // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            }
        }
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

    
    // MARK: - Navigation
    //DELEGATE FINALLLL!

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
      
            if segue.identifier == "editEventSegue" {
                let vc = segue.destinationViewController as! addEventViewController
                if let path = self.tableView.indexPathForSelectedRow() {
                  vc.delegate = self
                  vc.theEvent = events[path.row]
                  vc.operation = .Edit
                    
                }
                
            }
            
            if segue.identifier == "addEventSegue" {
                let vc = segue.destinationViewController as! addEventViewController
                vc.delegate = self
                vc.operation = .Add
            
            
            }
        
        
        
        
        
    }


}
