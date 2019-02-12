//
//  AuthServices.swift
//  breakpoint
//
//  Created by Sayooj Sojen on 12/02/19.
//  Copyright © 2019 spell. All rights reserved.
//

import Foundation
import Firebase

class AuthService{
    static let instance=AuthService()
    
    func registerUser(email:String, pass:String, completedCreation: @escaping completionHandler){//check env file for more deets
        Auth.auth().createUser(withEmail: email, password: pass) { (authResult, error) in
            guard let user=authResult?.user else{ //
                completedCreation(false,error)
                return//refer closure func in smack app to make sense
            }
            let userData=["provider" : user.providerID,
                          "email":user.email]
            DataInterfaceService.selfInstance.createUser(uid: user.uid, userData: userData as [String : Any])
            completedCreation(true,nil)
        }
    }
    func loginUser(email :String,pass:String,completedLogin: @escaping completionHandler){
        Auth.auth().signIn(withEmail: email, password: pass) { (loginResult, error) in
            guard let user = loginResult?.user else{
                completedLogin(false,error)
                return
            }
            completedLogin(true,nil)
            
        }
    }
    
}
