//
//  MenuController.swift
//  ScluptFIT-iOS
//
//  Created by wassim sefi  on 11/24/20.
//

import UIKit
import MapKit
import CoreLocation
import Alamofire
import SwiftyJSON

class MenuController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}


class HomeMenuController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}


class LocationMenuController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager: CLLocationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
         mapView.showsUserLocation = true
        mapView.isZoomEnabled = true
        // Do any additional setup after loading the view.
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let center = locations[0].coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        mapView.isZoomEnabled = true

    }
    
}


class FitnessMenuController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    let data=["abdo","bras","choulder","dos","jambe","poitrine"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_sortie_email.count
        //return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell")
        let contview = cell?.contentView
        let img = contview?.viewWithTag(1) as! UIImageView
        let label = contview?.viewWithTag(2) as! UILabel

        img.image = UIImage(named: data[indexPath.row])
        label.text = arr_sortie_email[indexPath.row]
    
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "mSegui", sender: indexPath)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath = sender as! IndexPath
        let exercice = data[indexPath.row]
        let destination = segue.destination as! FitnessController
        destination.name = exercice
    }
    
    var arr_sortie_email = [String]()
    var arr_sortie_fullname = [String]()
    var arr_sortie_phone = [String]()
    let URL_USER_SORTIE = "https://sclupt-fit.herokuapp.com/users/find/";
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.table.delegate = self
        self.table.dataSource = self
        
        Alamofire.request(URL_USER_SORTIE, method: .get).responseJSON
            {
                
                response in
                switch response.result{
                case .success:
                    print(response.result)
                    
                    let result = try? JSON(data: response.data!)
                    //   print(result)
                    self.arr_sortie_email.removeAll()
                    self.arr_sortie_fullname.removeAll()
                    self.arr_sortie_phone.removeAll()
                    
                    for i in result!.arrayValue{
                        //print(i)
                        let sortie_email = i["email"].stringValue
                        self.arr_sortie_email.append(sortie_email)
                        let sortie_fullname = i["fullName"].stringValue
                        self.arr_sortie_fullname.append(sortie_fullname)
                        let sortie_phone = i["phone"].stringValue
                        self.arr_sortie_phone.append(sortie_phone)
                        
                    }
                    
                    
                    self.table.reloadData()
                    
                    
                    break
                    
                case .failure:
                    
                    print(response.error!)
                    break
                    
                }
                
        }
        
        
    }
        
    
        
        
    }




class RunningMenuController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arr_sortie_email.count

        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mcell")
        let contview = cell?.contentView
        let label = contview?.viewWithTag(1) as! UILabel

        label.text = arr_sortie_email[indexPath.row]
    
        return cell!
        
    }
    
    var arr_sortie_email = [String]()
    var arr_sortie_fullname = [String]()
    var arr_sortie_phone = [String]()
    let URL_USER_SORTIE = "https://sclupt-fit.herokuapp.com/users/find/";

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       /* let params = [ "email": "user.email@email.com",
                      "password": "user.password",
                      "fullName" : "user.fullName",
                      "sexe" :"male",
                      "phone" : 22252225       ] as [String : Any]
        Alamofire.request("https://sclupt-fit.herokuapp.com/users/signup", method: .post, parameters: params as Parameters).responseJSON{(response) in print("response: ", response)}*/
        // Do any additional setup after loading the view.
        
        self.table.delegate = self
        self.table.dataSource = self
        
        Alamofire.request(URL_USER_SORTIE, method: .get).responseJSON
            {
                
                response in
                switch response.result{
                case .success:
                    print(response.result)
                    
                    let result = try? JSON(data: response.data!)
                    //   print(result)
                    self.arr_sortie_email.removeAll()
                    self.arr_sortie_fullname.removeAll()
                    self.arr_sortie_phone.removeAll()
                    
                    for i in result!.arrayValue{
                        //print(i)
                        let sortie_email = i["email"].stringValue
                        self.arr_sortie_email.append(sortie_email)
                        let sortie_fullname = i["fullName"].stringValue
                        self.arr_sortie_fullname.append(sortie_fullname)
                        let sortie_phone = i["phone"].stringValue
                        self.arr_sortie_phone.append(sortie_phone)
                        
                    }
                    
                    
                    self.table.reloadData()
                    
                    
                    break
                    
                case .failure:
                    
                    print(response.error!)
                    break
                    
                }
                
        }
        
        
    }
    
}


class ForumMenuController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_sortie_email.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mcell")
        let contview = cell?.contentView
        let img = contview?.viewWithTag(1) as! UIImageView
        let label = contview?.viewWithTag(2) as! UILabel

        img.image = UIImage(named: data[indexPath.row])
        label.text = arr_sortie_email[indexPath.row]
    
        return cell!
        
    }
    
    
    let data=["abdo","bras","choulder","dos","jambe","poitrine"]
    var arr_sortie_email = [String]()
    var arr_sortie_fullname = [String]()
    var arr_sortie_phone = [String]()
    let URL_USER_SORTIE = "https://sclupt-fit.herokuapp.com/users/find/";
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.table.delegate = self
        self.table.dataSource = self
        
        Alamofire.request(URL_USER_SORTIE, method: .get).responseJSON
            {
                
                response in
                switch response.result{
                case .success:
                    print(response.result)
                    
                    let result = try? JSON(data: response.data!)
                    //   print(result)
                    self.arr_sortie_email.removeAll()
                    self.arr_sortie_fullname.removeAll()
                    self.arr_sortie_phone.removeAll()
                    
                    for i in result!.arrayValue{
                        //print(i)
                        let sortie_email = i["email"].stringValue
                        self.arr_sortie_email.append(sortie_email)
                        let sortie_fullname = i["fullName"].stringValue
                        self.arr_sortie_fullname.append(sortie_fullname)
                        let sortie_phone = i["phone"].stringValue
                        self.arr_sortie_phone.append(sortie_phone)
                        
                    }
                    
                    
                    self.table.reloadData()
                    
                    
                    break
                    
                case .failure:
                    
                    print(response.error!)
                    break
                    
                }
                
        }
        
        
    }
    
}


class ProfileMenuController: UIViewController/*, UITableViewDelegate, UITableViewDataSource*/{
   
      /*  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return arr_sortie_email.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = table.dequeueReusableCell(withIdentifier: "mcell")
            
            
            cell?.textLabel?.text = arr_sortie_email[indexPath.row]
            
            
            return cell!
        }
        
        */
       // var arr_sortie_email = [String]()
        //var arr_sortie_fullname = [String]()
        //var arr_sortie_phone = [String]()
        let URL_USER_SORTIE = "https://sclupt-fit.herokuapp.com/users/find/5fcaa6fe55106324acdfdfce";
        
       
        
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var telephone: UILabel!
    
    @IBOutlet weak var sexe: UILabel!
    @IBOutlet weak var email: UILabel!
    // @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
            super.viewDidLoad()
            
          //  self.table.delegate = self
          //  self.table.dataSource = self
            
            Alamofire.request(URL_USER_SORTIE, method: .get).responseJSON
                {
                    
                    response in
                    switch response.result{
                    case .success:
                        print(response.result)
                        
                        let result = try? JSON(data: response.data!)
                        //   print(result)
                       // self.arr_sortie_email.removeAll()
                        //self.arr_sortie_fullname.removeAll()
                        //self.arr_sortie_phone.removeAll()
                        
                        
                            //print(i)
                            let sortie_email = result!["email"].stringValue
                        self.email?.text?.append(sortie_email)
                            let sortie_fullname = result!["fullName"].stringValue
                        self.name.text?.append(sortie_fullname )
                        let sortie_phone = result!["phone"].stringValue
                        self.telephone.text?.append(sortie_phone)
                        let sortie_sexe = result!["sexe"].stringValue
                        self.sexe.text?.append(sortie_sexe)
                            
                    
                        
                        
                       // self.table.reloadData()
                        
                        
                        break
                        
                    case .failure:
                        
                        print(response.error!)
                        break
                        
                    }
                    
            }
            
       
        
        
    

        }
    
    

    
    
    }
    

