//
//  CommentController.swift
//  ScluptFIT-iOS
//
//  Created by wassim sefi  on 12/11/20.
//

import UIKit
import Alamofire

class CommentController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBOutlet weak var commentText: UITextField!
    
    @IBAction func AddComment(_ sender: Any) {
        
        
        
        // /posts/comments/{idPost}&{text}&{idUser}
        Alamofire.request("https://sclupt-fit.herokuapp.com/posts/comments/5fccc79c1b1ffb0004db3d7e&hellowasssimdjjdkjd&5fcaa6fe55106324acdfdfce", method: .post).responseJSON{(response) in print("response: ", response)}
        
        
        
        
        
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
