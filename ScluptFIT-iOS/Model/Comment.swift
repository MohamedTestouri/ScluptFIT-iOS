//
//  Comment.swift
//  ScluptFIT-iOS
//
//  Created by Mohamed Testouri on 12/5/20.
//

import Foundation
import ObjectMapper



class Comment: NSObject, Mappable {
    
    var id: String?
    var text: String?
    var idUser: String?
    var date: Date?

     override init() {
    super.init()
     }

    convenience required init?(map: Map) {
    self.init()
    }

    
    func mapping(map: Map){
        id    <- map["_id"]
        text <- map["text"]
        date <- map["date"]
     }
    
   
    
    
}
