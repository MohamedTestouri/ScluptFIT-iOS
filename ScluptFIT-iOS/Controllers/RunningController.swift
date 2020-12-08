//
//  RunningController.swift
//  ScluptFIT-iOS
//
//  Created by Mohamed Testouri on 11/25/20.
//

// Location Tracking : https://www.innofied.com/implement-location-tracking-using-mapkit-in-swift/

import UIKit
import MapKit
import CoreLocation
import Alamofire

class RunningController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var postService = PostService()

    //let headers = ["Content-Type" : "application/json"]
    @IBAction func test(_ sender: Any) {
      //  Alamofire.request("http:/sclupt-fit.herokuapp.com/posts", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).validate().responseJSON{
        //    (response) in    print("response: ", response)
            
   // }
        self.postService.getAllPosts()
    }
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager: CLLocationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        mapView.showsUserLocation = true
       mapView.isZoomEnabled = true
    
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
