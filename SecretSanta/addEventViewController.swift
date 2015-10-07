//
//  addEventViewController.swift
//  SecretSanta
//
//  Created by Joenabie M Gamao on 10/5/15.
//  Copyright (c) 2015 Joenabie M Gamao. All rights reserved.
//

import UIKit


protocol ParticipantsDelegate{
    
    func addParticipants(participant: User)
    
    
}

class addEventViewController: UIViewController, UITextFieldDelegate,UITableViewDataSource, UITableViewDelegate,ParticipantsDelegate {
    
    
    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var eventDescription: UITextField!
    
    @IBOutlet weak var eventVenue: UITextField!
    
    @IBOutlet weak var eventDate: UIDatePicker!
    @IBOutlet weak var eventDeadline: UITextField!
    
    @IBOutlet weak var eventDateTF: UITextField!
    
    @IBOutlet weak var participantsTableView: UITableView!
    
    @IBOutlet weak var eventDateView: UIView!
    
    var delegate: EventDelegate!
    var theEvent: Event!
    var operation: Operation = Operation.Add
    
    
    var participants: [User] = []
    

    

    func addParticipants(participant: User)
    {
        
    //    self.participants = theEvent.participants
        theEvent.participants.append(participant)
        self.participantsTableView.reloadData()
    }
    
    
    @IBAction func addEvent1(sender: AnyObject) {
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        var strEventDate = dateFormatter.stringFromDate(eventDate.date)
        
        
        
        if theEvent == nil {
            
            theEvent = Event(title: eventTitle.text, description: eventDescription.text, eventDeadline: eventDeadline.text,     eventDate: strEventDate, venue: eventVenue.text, participants: [], recipients: [])
            
            delegate.addEvent(theEvent)
        }
        else {
            
            
            theEvent.title = eventTitle.text
            theEvent.description = eventDescription.text
            theEvent.venue = eventVenue.text
            theEvent.eventDeadline = eventDeadline.text
            theEvent.eventDate = strEventDate
            delegate.editEvent()
        }
        
        
        self.navigationController?.popViewControllerAnimated(true)

    }
    
    
    //DATE PICKER PICKER VIEW
   //SIR CGROM
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
    //    self.participants = theEvent.participants
        
        //SHOW OLD VALUES WHEN EDIT MODE
        if theEvent != nil {
            eventTitle.text = theEvent.title
            eventDescription.text = theEvent.description
            //eventDate. = theEvent.eventDate
            eventVenue.text = theEvent.venue
            eventDeadline.text = theEvent.eventDeadline
            var dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
           // println(theEvent.eventDate)
            eventDate.date =  dateFormatter.dateFromString(theEvent.eventDate)!
            // DATE PICKER LABEL
            var strEventDate = dateFormatter.stringFromDate(eventDate.date)
            eventDateTF.text = strEventDate
            self.participants = self.theEvent.participants
            
            self.navigationItem.title = "Edit An Event"
        
        }
        
        eventDateView.removeFromSuperview()
        
        eventDateTF.inputView = eventDate
        
        
        //PARTICIPANTS
        
        
        

        // Do any additional setup after loading the view.
    }
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier! ==  "participantsSegue" {
            
            if let vc = segue.destinationViewController as? participantsTableViewController {
                
                vc.delegate = self
                
                
                
            }
            
        }

    }
    
    
    
    
    //FOR MY PARTICIPANTS TABLEVIEW
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
       // println("pasok")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return theEvent.participants.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Participants"
        }
        else {
            return ""
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("participantsIdentifier", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel!.text = theEvent.participants[indexPath.row].firstName
        
        return cell
    }
    // Override to support editing the table view.
   func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            if editingStyle == .Delete {
                theEvent.participants.removeAtIndex(indexPath.row)
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
    


}
