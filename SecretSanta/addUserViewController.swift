//
//  addUserViewController.swift
//  SecretSanta
//
//  Created by Joenabie M Gamao on 10/5/15.
//  Copyright (c) 2015 Joenabie M Gamao. All rights reserved.
//

import UIKit

class addUserViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var alias: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var gender: UISegmentedControl!
    
    var delegate: UserDelegate!
    var theUser : User!
   

    @IBAction func saveButton(sender: AnyObject) {
        // NEW USER
        if theUser == nil {
            theUser = User(alias: alias.text, firstName: firstName.text, lastName: lastName.text, email: email.text,password: password.text, gender: Gender.Male, posts: [])
            
            delegate.addUser(theUser)
        }
        // EDIT LANG
        else {
            theUser.firstName = firstName.text
            theUser.lastName = lastName.text
            theUser.alias = alias.text
            theUser.email = email.text
            theUser.password = password.text
            theUser.gender = Gender.Male
            
            
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if theUser != nil {
            
            firstName.text = theUser.firstName
            lastName.text = theUser.lastName
            alias.text = theUser.alias
            email.text = theUser.email
            password.text = theUser.password
            
            self.navigationItem.title = "Edit a User"
            
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
