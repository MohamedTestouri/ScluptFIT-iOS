//
//  SignupStep1Controller.swift
//  ScluptFIT-iOS
//
//  Created by wassim sefi  on 11/24/20.
//

import UIKit
import MapKit
import CoreLocation
import Alamofire
import SwiftyJSON

class SignupStep1Controller: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var fullNameText: UITextField!
    @IBOutlet weak var sexeText: UITextField!
    @IBOutlet weak var phoneText: UITextField!

  //  @IBOutlet weak var label: UILabel!
    //@IBOutlet weak var signupBtn: UIButton!
    @IBAction func Signup(_ sender: Any) {
        
        guard let email = emailText.text, !email.isEmpty else {
        let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre email", preferredStyle: UIAlertController.Style.alert)
         myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
         self.present(myalert, animated: true)
                    return}
        guard let password = passwordText.text, !password.isEmpty else {
        let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre password", preferredStyle: UIAlertController.Style.alert)
         myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
         self.present(myalert, animated: true)
                    return}
        
        guard let fullName = fullNameText.text, !fullName.isEmpty else {
        let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre full name", preferredStyle: UIAlertController.Style.alert)
         myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
         self.present(myalert, animated: true)
                    return}
        guard let sexe = sexeText.text, !sexe.isEmpty else {
        let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre sexe", preferredStyle: UIAlertController.Style.alert)
         myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
         self.present(myalert, animated: true)
                    return}
        guard let phone = phoneText.text, !phone.isEmpty else {
        let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer votre phone", preferredStyle: UIAlertController.Style.alert)
         myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
         self.present(myalert, animated: true)
                    return}
       
        if(isValidTel(telID: phone) == false )
        {
            let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer valide telephone", preferredStyle: UIAlertController.Style.alert)
             myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
             self.present(myalert, animated: true)
        }
     
        if(isValidEmail(emailID: email) == false )
        {
            let myalert = UIAlertController(title: "Vérifier votre information", message: "Entrer valide mail", preferredStyle: UIAlertController.Style.alert)
             myalert.addAction(UIAlertAction(title: "Réessayez", style: .default) { (action:UIAlertAction!) in})
             self.present(myalert, animated: true)
        }
        
        let params = [ "email": email,
                       "password": password,
                       "fullName" : fullName,
                       "sexe" :sexe,
                       "phone" : phone    ] as [String : Any]
         Alamofire.request("https://sclupt-fit.herokuapp.com/users/signup", method: .post, parameters: params as Parameters).responseJSON{(response) in print("response: ", response)}
        
        
        
        
        
        
        
        
    }
    
    func isValidEmail(emailID:String) -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: emailID)
        }
    func isValidTel(telID:String) -> Bool {
            let telRegEx = "[0-9]{8,}"
            let telTest = NSPredicate(format:"SELF MATCHES %@", telRegEx)
            return telTest.evaluate(with: telID)
        }
    

    
}
