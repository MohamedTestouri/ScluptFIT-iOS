//
//  Exercice.swift
//  ScluptFIT-iOS
//
//  Created by wassim sefi  on 12/5/20.
//
import Foundation

class Exercice: Codable {

    var id: String?
    var name: String?
    var description: String?
    var category: String?
    var model: String?
    var audio: String?
    var image: String?

init() {

}
    init(id: String, name: String, description : String, category: String, model: String, audio: String, image: String) {
        self.id = id
        self.name = name
        self.description = description
        self.category = category
        self.model = model
        self.audio = audio
        self.image = image
    }
    
    
    
}

  
    
    

