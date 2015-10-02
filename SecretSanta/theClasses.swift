//
//  myClasses.swift
//  SecretSanta
//
//  Created by Joenabie M Gamao on 10/2/15.
//  Copyright (c) 2015 Joenabie M Gamao. All rights reserved.
//

import Foundation
import UIKit

enum Gender{
    case Male, Female
}


class User {
    var alias: String
    var firstName: String
    var lastName: String
    var email: String
    var gender: Gender
    var posts: [Post] = []
    
    
    
    init(){
        self.alias = "vampireDoll"
        self.firstName = "Joenabie"
        self.lastName = "Gamao"
        self.email = "jmgamao@addu.edu.ph"
        self.gender = Gender.Female
        self.posts = []
    }
    
    init(alias: String, firstName: String, lastName: String, email: String, gender: Gender, posts: [Post]){
        self.alias = alias
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
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
    var time: String
    var participants : [User] = []
    var recipients : [User] = []
    
    
    
    init(){
        self.title = "CS4A Christmas Party"
        self.description = "ADDU CS 4A Christmas Party This Decemeber 25th!"
        self.eventDeadline = "December 20, 2015"
        self.eventDate =  "December 25, 2015"
        self.venue = "ADDU F213"
        self.time = "1:30 pm - 5:00 pm"
        self.participants.append(User())
        
        
        self.recipients.append(User(alias: "dracula4u", firstName: "Nick", lastName: "Jonas", email: "nick@yahoo.com", gender: Gender.Male, posts: []))
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




























