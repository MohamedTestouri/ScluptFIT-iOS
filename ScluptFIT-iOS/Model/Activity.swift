//
//  Activity.swift
//  ScluptFIT-iOS
//
//  Created by Mohamed Testouri on 12/5/20.
//

import Foundation
import ObjectMapper


class Activity: NSObject, Mappable {
   

        var id: String?
        var sum:Int!
        var categoryExercice:String?
       
    
    override init() {
        super.init()
    }

        convenience required init?(map: Map) {
        self.init()
    }
 
    
    // Mappable
    func mapping(map: Map) {

        id    <- map["id"]
        sum    <- map["sum"]
        categoryExercice    <- map["categoryExercice"]
     
    }
    
}
