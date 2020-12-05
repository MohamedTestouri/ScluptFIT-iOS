//
//  HealthInformation.swift
//  ScluptFIT-iOS
//
//  Created by wassim sefi  on 12/5/20.
//

import ObjectMapper


class HealthInformation: NSObject, Mappable {
    
   
  
        var _id: String?
        var calories:Int!
        var steps:Int!
        var date:Date?
        var weight:Int!
        var height:Int!
        
    override init() {
        super.init()
    }

        convenience required init?(map: Map) {
        self.init()
    }
    
    // Mappable
    func mapping(map: Map) {

        _id    <- map["_id"]
        calories    <- map["calories"]
        steps    <- map["steps"]
        date    <- map["date"]
        weight    <- map["weight"]
        height    <- map["height"]
    }
    
}
