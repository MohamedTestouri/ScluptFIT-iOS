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
    
 var userservice = UserService()
    var parameters : [String: Any] = [:]	
    var webServiceRequest = WebServiceRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.password.delegate=self
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func loginAction(_ sender: Any) {
        
        guard let email = email.text, !email.isEmpty else {
        let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre mail", preferredStyle: UIAlertController.Style.alert)
         myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
         self.present(myalert, animated: true)
                        
//            labelerreurr.isHidden = false
  //                  labelerreurr.text = "entrer mail complet"
                    return
                }
        guard let password = password.text, !password.isEmpty else {
                    let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre mot de passe", preferredStyle: UIAlertController.Style.alert)
                     myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
                     self.present(myalert, animated: true)
                    //                labelerreurr.isHidden = false
      //              labelerreurr.text = "entrer mot de passe"
                    return
                }
        
    //    guard let serverUrl = URL(string: "https://scluptfit.herokuapp.com/users/login") else { return }
        
       // guard let serverUrl2 = URL(string: "http://sclupt-fit.herokuapp.com/posts") else { return }


        

        var user : User = User(email: email , password: password)
        self.userservice.login(user: user)
   
        //DataResponse<User>

        //Alamofire.request(serverUrl2, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: //headers).validate().responseJSON { (response) in
                
              //  print("response", response)
            
             //}
    
           // UserDefaults.standard.setValue(<#T##value: Any?##Any?#>, forKey: <#T##String#>)
           // UserDefaults.standard.value(forKey: <#T##String#>)
    }
        
      
            
        
//        self.webServiceRequest.callWebService(event : Constants.post , header : headers, method: .post, completion: {(response : Post!, error: Bool) in
//
//            if error == false{
//
//
//            }
            
            
      // })
    
    
}

