//
//  DataInterfaceService.swift
//  breakpoint
//
//  Created by Sayooj Sojen on 12/02/19.
//  Copyright © 2019 spell. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE=Database.database().reference() //returns the root of the firebase db (ie the link)

class DataInterfaceService{
    
    static let selfInstance=DataInterfaceService()
    
    private var _REF_BASE = DB_BASE
    private var _REF_USERS = DB_BASE.child("users")
    private var  _REF_FEEDS = DB_BASE.child("feed")
    private var _REF_GROUPS = DB_BASE.child("groups")
    //setting a folderlike path structure for each catagory inside the db
    //notice the undescores before the vars, while the vars below dont have _. Its to set private readonly vars
    var REF_BASE: DatabaseReference{
        return _REF_BASE
    }
    var REF_USERS: DatabaseReference{
        return _REF_USERS
    }
    var REF_FEEDS: DatabaseReference{
        return _REF_FEEDS
    }
    var REF_GROUPS: DatabaseReference{
        return _REF_GROUPS
    }
    
    func createUser(uid: String,userData: [String:Any]){
        REF_USERS.child(uid).updateChildValues(userData)
        
    }
}
