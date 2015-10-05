//
//  addEventViewController.swift
//  SecretSanta
//
//  Created by Joenabie M Gamao on 10/5/15.
//  Copyright (c) 2015 Joenabie M Gamao. All rights reserved.
//

import UIKit

class addEventViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var eventTitle: UITextField!
    @IBOutlet weak var eventDescription: UITextField!
    
    @IBOutlet weak var eventVenue: UITextField!
    
    @IBOutlet weak var eventDate: UIDatePicker!
    @IBOutlet weak var eventDeadline: UITextField!
    
    
    
    var delegate: EventDelegate!
    var theEvent: Event!
    var operation: Operation = Operation.Add
    
    
    @IBAction func addEvent(sender: AnyObject) {
        
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //SHOW OLD VALUES WHEN EDIT MODE
        if theEvent != nil {
            eventTitle.text = theEvent.title
            eventDescription.text = theEvent.description
            //eventDate. = theEvent.eventDate
            eventVenue.text = theEvent.venue
            eventDeadline.text = theEvent.eventDeadline
            var dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            println(theEvent.eventDate)
            eventDate.date =  dateFormatter.dateFromString(theEvent.eventDate)!
            self.navigationItem.title = "Edit An Event"
        
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
