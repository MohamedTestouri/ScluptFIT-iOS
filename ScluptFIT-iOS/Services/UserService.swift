//
//  UserService.swift
//  ScluptFIT-iOS
//
//  Created by Mohamed Testouri on 12/5/20.
//

import Foundation
import Alamofire

class UserService{
    func login(user : User) {
        let params = [ "email" : user.email,
                       "password": user.password]
        Alamofire.request(Constants.API_URL+"/users/login", method: .post, parameters: params as Parameters, encoding: JSONEncoding.default, headers: Constants.Headers).validate().responseJSON{(response) in print("response: ", response)}
    }
    
    func signup(user : User) {
        let params = [ "email": user.email,
                      "password": user.password,
                      "fullName" : user.fullName,
                      "birthday" : user.birthday,
                      "sexe" : user.sexe,
                      "phone" : user.phone        ] as [String : Any]
        Alamofire.request(Constants.API_URL+"/user/signup", method: .post, parameters: params as Parameters, encoding: JSONEncoding.default, headers: Constants.Headers).validate().responseJSON{(response) in print("response: ", response)}
    }
    
    //Get
    func getUser(idUser : String) {
        Alamofire.request(Constants.API_URL+"/users/find/\(idUser)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constants.Headers).validate().responseJSON{ (response) in
    print("response: ", response)
        
        }
    }
    //Post
    func addRun(idUser: String, run : Run) -> Void{
        Alamofire.request(Constants.API_URL+"/users/runs/\(idUser)&\(run.calories)&\(run.distance)&\(run.duration)", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: Constants.Headers).validate().responseJSON{(response) in print("response: ", response)}
    }
    func addHealthInformation(idUser: String, healthInformation : HealthInformation) -> Void{
        Alamofire.request(Constants.API_URL+"/users/hi/\(idUser)&\(healthInformation.calories)&\(healthInformation.steps)&\(healthInformation.weight)&\(healthInformation.height)", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: Constants.Headers).validate().responseJSON{(response) in print("response: ", response)}
        
    }
    func addActivity(idUser : String, activity: Activity) -> Void{
        Alamofire.request(Constants.API_URL+"/users/activities/\(idUser)&\(activity.sum)&\(activity.categoryExercice)", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: Constants.Headers).validate().responseJSON{(response) in print("response: ", response)}
    }
    //Update
    func updateActivity(idUser : String, activity: Activity) -> Void{
        let params = ["sum" : activity.sum]
        Alamofire.request(Constants.API_URL+"/users/activities/\(idUser)/update/\(activity.categoryExercice)", method: .patch, parameters: params, encoding: JSONEncoding.default, headers: Constants.Headers).validate().responseJSON{(response) in print("response: ", response)}
    }
    //Delete
    func deleteUser(idUser: String) -> Void{
        Alamofire.request(Constants.API_URL+"/users/\(idUser)", method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: Constants.Headers).validate().responseJSON{(response) in print("response: ", response)}
    }
}
