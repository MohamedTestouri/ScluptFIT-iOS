//
//  Post.swift
//  ScluptFIT-iOS
//
//  Created by Mohamed Testouri on 12/5/20.
//

import Foundation
import ObjectMapper



class Post: NSObject, Mappable {
    
    var id: String?
    var text: String?
    var likes: Int!
    var date : Date?
    var image: String?
    var idUser: String?
    var commentArrayList: Array<Comment>=Array()

override init() {
    super.init()
}

    convenience required init?(map: Map) {
    self.init()
}

    
    // Mappable
     
    func mapping(map: Map){
        id    <- map["_id"]
        text <- map["text"]
        likes <- map["likes"]
        date <- map["date"]
        image <- map["image"]
        idUser <- map["idUser"]
        commentArrayList <- map["comments"]
    }
    
    
}
