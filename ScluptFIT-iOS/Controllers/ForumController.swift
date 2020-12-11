//
//  ForumController.swift
//  ScluptFIT-iOS
//
//  Created by wassim sefi  on 12/11/20.
//

import UIKit

class ForumController: UIViewController {
    
    var name:String?
    var datee:String?
    var idUser:String?
    
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var date: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        photo.image = UIImage(named: "mouSalah")
        date.text = datee!
        print("id User :")
        print (idUser!)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
