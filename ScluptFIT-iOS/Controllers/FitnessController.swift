//
//  FitnessController.swift
//  ScluptFIT-iOS
//
//  Created by wassim sefi  on 11/25/20.
//

import UIKit

class FitnessController: UIViewController {

    var name:String?
    var email:String?
    
    @IBOutlet weak var exercieImage: UIImageView!
    @IBOutlet weak var exerciceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        exercieImage.image = UIImage(named: name!)
        exerciceLabel.text = email!
        
        
        
        
    }
    

   

}
