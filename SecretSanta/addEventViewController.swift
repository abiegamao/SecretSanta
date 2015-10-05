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
    
    
    @IBAction func addEvent(sender: AnyObject) {
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        var strEventDate = dateFormatter.stringFromDate(eventDate.date)
        
        theEvent = Event(title: eventTitle.text, description: eventDescription.text, eventDeadline: eventDeadline.text, eventDate: strEventDate, venue: eventVenue.text, participants: [], recipients: [])
        
        
     delegate.addEvent(theEvent)
        
        
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
