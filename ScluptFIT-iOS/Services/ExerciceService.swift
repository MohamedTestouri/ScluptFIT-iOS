//
//  ExerciceService.swift
//  ScluptFIT-iOS
//
//  Created by Mohamed Testouri on 12/5/20.
//

import Foundation
import Alamofire

class ExerciceService {
    func getExerciceByCategory(category : String){
        Alamofire.request(Constants.API_URL+"/exercices/find/\(category)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constants.Headers).validate().responseJSON{ (response) in
    print("response: ", response)
        
        }
        
    }
}
