//
//  myClasses.swift
//  SecretSanta
//
//  Created by Joenabie M Gamao on 10/2/15.
//  Copyright (c) 2015 Joenabie M Gamao. All rights reserved.
//

import Foundation
import UIKit

enum Gender: Int{
    case Male = 0 , Female = 1
}
enum Operation: String {
    case Add = "Add", Edit = "Edit"
}

class User {
    var alias: String
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var gender: Gender
    var posts: [Post] = []
    
    
    
    init(){
        self.alias = "vampireDoll"
        self.firstName = "Joenabie"
        self.lastName = "Gamao"
        self.email = "jmgamao@addu.edu.ph"
        self.password = "1234"
        self.gender = Gender.Female
        self.posts = []
    }
    
    init(alias: String, firstName: String, lastName: String, email: String, password: String, gender: Gender, posts: [Post]){
        self.alias = alias
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.gender = gender
        self.posts = posts
    }
    
    func displayName()->String{
        return self.firstName + " " + self.lastName
    }
    
    
}


class Event{
    var title: String
    var description: String
    var eventDeadline: String
    var eventDate: String
    var venue: String
    var participants : [User] = []
    var recipients : [User] = []
    
    
    
    init(){
        self.title = "CS4A Christmas Party"
        self.description = "ADDU CS 4A Christmas Party This Decemeber 25th!"
        self.eventDeadline = "3"
        self.eventDate =  "07-10-2015 20:09"
        self.venue = "ADDU F213"
        self.participants.append(User())
        
        
        self.recipients.append(User(alias: "dracula4u", firstName: "Nick", lastName: "Jonas", email: "nick@yahoo.com",password: "123", gender: Gender.Male, posts: []))
    }
    
    init(title: String, description: String, eventDeadline: String, eventDate: String, venue: String,participants: [User], recipients: [User]){
        
        self.title = title
        self.description = description
        self.eventDeadline = eventDeadline
        self.eventDate = eventDate
        self.venue = venue
        self.participants = participants
        self.recipients = recipients
        
        
    }
    
    
    
    
}

class Post{
    var post : String
    var date : String
    
    
    init(){
        self.post = "I want to have PS4"
        self.date =  "ss"
    }
    
    init(post: String, date: String){
        self.post = post
        self.date = date
    }
    
    
    
    
}




























