//
//  User.swift
//  ScluptFIT-iOS
//
//  Created by wassim sefi  on 12/4/20.
//

import ObjectMapper

class User: NSObject, Mappable {
    
    var idUser: String?
    var password: String?
    var email:String?
    var fullName:String?
    var phone:Int!
    var sexe:String?

    var birthday:String?
    var healthInformationArryList: Array<HealthInformation>=Array()
    var runArryList: Array<Run>=Array()
    var activityArryList: Array<Activity>=Array()


    override init() {
        super.init()
    }

        convenience required init?(map: Map) {
        self.init()
    }

      // Mappable
      public func mapping(map: Map) {

        idUser    <- map["_id"]
        email    <- map["email"]
        password    <- map["password"]
        fullName    <- map["fullName"]
        phone    <- map["phone"]
        sexe    <- map["sexe"]
        birthday    <- map["birthday"]
        healthInformationArryList    <- map["healthInformation"]
        runArryList    <- map["runs"]
        activityArryList    <- map["activities"]


      }
  
}
