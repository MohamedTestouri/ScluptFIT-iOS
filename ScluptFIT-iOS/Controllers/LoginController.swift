//
//  LoginController.swift
//  ScluptFIT-iOS
//
//  Created by wassim sefi  on 11/24/20.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class LoginController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    

    var parameters : [String: Any] = [:]
    var webServiceRequest = WebServiceRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.password.delegate=self
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func loginAction(_ sender: Any) {
        
        
        guard let serverUrl = URL(string: "https://scluptfit.herokuapp.com/users/login") else { return }
        
        guard let serverUrl2 = URL(string: "http://sclupt-fit.herokuapp.com/posts") else { return }


        guard let email = email.text, !email.isEmpty else {return}
        guard let password = password.text, !password.isEmpty else {return}


      let loginRequest = [
                   "email" : "mohamed.testouri@esprit.tn",
                   "password" : "HelloWorld"
               ]
        let headers = ["Content-Type" : "application/json"]
        
        //DataResponse<User>

        Alamofire.request(serverUrl2, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).validate().responseJSON { (response) in
                
                print("response", response)
            
             }
        
      
            
        
//        self.webServiceRequest.callWebService(event : Constants.post , header : headers, method: .post, completion: {(response : Post!, error: Bool) in
//
//            if error == false{
//
//
//            }
            
            
      // })
    
    
}
}
