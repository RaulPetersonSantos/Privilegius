//
//  DataBase.swift
//  PrivieLegius
//
//  Created by raul.santos on 30/10/22.
//

import Foundation
import FirebaseDatabase
import Firebase

final class DataBase {
    
    static let shared = DataBase()
    let database = Database.database().reference()
    var userName: String = ""
    var userData : [ChatAppUser] = [ChatAppUser]()
    let userID = Auth.auth().currentUser?.uid
    var getEmail: String  = ""
    let defaults = UserDefaults.standard
    
    public func userExists(with email: String, completion: @escaping((Bool) -> Void)) {
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        database.child("users").child("user").child(String("id \(userID!)")).child(safeEmail).observeSingleEvent(of: .value, with: { snapshot in
            if snapshot.exists(){
                completion(true)
                return
            }
            completion(false)
            
        })
    }
    
    public func insertUser(with user: ChatAppUser) {
  
        database.child("users").child("user").child(user.safeEmail).setValue([
            "first_name": user.firstName,
            "last_name": user.lastName,
            "email_adress": user.emailAddress,
            "password": user.password,
        ])
        getEmail = user.safeEmail
    }
        
    public func getUserInfo(with email:String ,onSucess: @escaping () -> Void, onError: @escaping (_ error: Error?) -> Void) {
        let defaults = UserDefaults.standard
        let ref = Database.database().reference()
        var safeEmail = email.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
        
        ref.child("users").child("user").child(safeEmail).observe(.value, with: { snapshot in
            
            if let dictionary = snapshot.value as? [String : Any] {
                let email = dictionary["email_adress"] as! String
                let name = dictionary["first_name"] as! String
                let lastName = dictionary["last_name"] as! String
                let password = dictionary["password"] as! String

                defaults.set(email, forKey: "userEmailKey")
                defaults.set(name, forKey: "userNameKey")
                defaults.set(lastName, forKey: "userLastName")
                defaults.set(password, forKey: "userPasswordKey")

        
                print("valor\(dictionary)")
                onSucess()

            }
        }) { (error) in
            onError(error)
        }

    }
    
}

struct ChatAppUser {
    let firstName: String
    let lastName: String
    let emailAddress: String
    let password: String
    var safeEmail: String {
        var safeEmail = emailAddress.replacingOccurrences(of: ".", with: "-")
        safeEmail = safeEmail.replacingOccurrences(of: "@", with: "-")
    
        return safeEmail
    }
    
}
