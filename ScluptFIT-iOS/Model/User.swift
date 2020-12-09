//
//  User.swift
//  ScluptFIT-iOS
//
//  Created by wassim sefi  on 12/4/20.
//

import UIKit

class User: Codable {
    
    var idUser: String?
    var password: String?
    var email:String
    var fullName:String
    var phone:Int!
    var sexe:String?

    var birthday:String?
    //var healthInformationArryList: Array<HealthInformation>=Array()
    //var runArryList: Array<Run>=Array()
    //var activityArryList: Array<Activity>=Array()


    init(email : String,password : String,fullName : String,sexe : String,phone : Int) {
    
        self.email = email
        self.password = password
        self.fullName = fullName
        self.sexe = sexe
        self.phone = phone
       
        
    }
}
