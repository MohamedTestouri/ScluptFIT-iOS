//
//  Exercice.swift
//  ScluptFIT-iOS
//
//  Created by wassim sefi  on 12/5/20.
//
import Foundation
import ObjectMapper


      
  

class Exercice: NSObject, Mappable {
    
    var id: String?
    var name: String?
    var _description: String?
    var category: String?
    var model: String?
    var audio: String?
    var image: String?

override init() {
    super.init()
}

    convenience required init?(map: Map) {
    self.init()
}

    // Mappable
     func mapping(map: Map) {

      id    <- map["_id"]
      name    <- map["name"]
      _description    <- map["_description"]
      category    <- map["category"]
      model    <- map["model"]
      audio    <- map["audio"]
      image    <- map["image"]
  


    }
  
    
    
}
