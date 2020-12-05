//
//  Run.swift
//  ScluptFIT-iOS
//
//  Created by Mohamed Testouri on 12/5/20.
//

import Foundation
import ObjectMapper


class Run: NSObject, Mappable {
 
  

        var id: String?
        var calories:Int!
        var distance:Int!
        var duration:Int!
        var date:Date?
        
    override init() {
        super.init()
    }

        convenience required init?(map: Map) {
        self.init()
    }
    
    // Mappable
    func mapping(map: Map) {

        id    <- map["id"]
        calories    <- map["calories"]
        distance    <- map["distance"]
        duration    <- map["duration"]
        date    <- map["date"]
    }
    
}
