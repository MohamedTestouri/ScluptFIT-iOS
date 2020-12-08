//
//  PostService.swift
//  ScluptFIT-iOS
//
//  Created by Mohamed Testouri on 12/5/20.
//

import Foundation
import Alamofire

class PostService{
    func getAllPosts(){
        Alamofire.request(Constants.API_URL+"/posts", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constants.Headers).validate().responseJSON{ (response) in
    print("response: ", response)
            
    }
    }
    func getPostById(idPost: String){
        Alamofire.request(Constants.API_URL+"/posts/\(idPost)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constants.Headers).validate().responseJSON{ (response) in
    print("response: ", response)
        
        }
        
    }
    func getPostsByIdUser(idUser: String) {
        Alamofire.request(Constants.API_URL+"/posts/find\(idUser)", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: Constants.Headers).validate().responseJSON{ (response) in
    print("response: ", response)
        
        }
    }
    
    //POST
    func addComment(idPost: String, comment: Comment)-> Void{
        let idUser = comment.idUser
        let text = comment.text
        Alamofire.request(Constants.API_URL+"/posts/comments/\(idPost)&\(text)&\(idUser)", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: Constants.Headers).validate().responseJSON{ (response) in
    print("response: ", response)
        
        }
    }
    func addPost(post : Post)-> Void{
        let params = ["text" : post.text,
                      "idUser" : post.idUser,
                      "image" : post.image]
        Alamofire.request(Constants.API_URL+"/posts/", method: .post, parameters: params as Parameters, encoding: JSONEncoding.default, headers: Constants.Headers).validate().responseJSON{ (response) in
    print("response: ", response)
        
        }
    }
    
    //Update
    func updateLikes(idPost: String, like: Int)-> Void{
        let params = ["likes" : like]
        Alamofire.request(Constants.API_URL+"/posts/likes/\(idPost)", method: .patch, parameters: params, encoding: JSONEncoding.default, headers: Constants.Headers).validate().responseJSON{(response) in print("response: ", response)}
    }
    func updateText(idPost: String, text: String)-> Void{
        let params = ["text" : text]
        Alamofire.request(Constants.API_URL+"/posts/text/\(idPost)", method: .patch, parameters: params, encoding: JSONEncoding.default, headers: Constants.Headers).validate().responseJSON{(response) in print("response: ", response)}
    }
    
    //Delete
    func deletePost(idPost: String)-> Void{
        Alamofire.request(Constants.API_URL+"/posts/\(idPost)", method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: Constants.Headers).validate().responseJSON{(response) in print("response: ", response)}
    }
    
}
