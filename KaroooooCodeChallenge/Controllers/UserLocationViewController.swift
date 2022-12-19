//
//  UserLocationViewController.swift
//  KaroooooCodeChallenge
//
//  Created by Sanjay on 19/12/22.
//

import UIKit
import MapKit
import CoreLocation
class UserLocationViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var userDetails:Usermodel?
    override func viewDidLoad() {
        super.viewDidLoad()
        let latitude : CLLocationDegrees = Double(userDetails?.address?.geo?.lat ?? "0") ?? 0
        let longitude : CLLocationDegrees = Double(userDetails?.address?.geo?.lng ?? "0") ?? 0
        let latitudeDel : CLLocationDegrees = 0.1
        let longitudeDel : CLLocationDegrees = 0.1
        let location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let span : MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latitudeDel, longitudeDelta: longitudeDel)
        let region : MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        self.mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title =  userDetails?.address?.city ?? ""
        annotation.subtitle =  userDetails?.address?.street ?? ""
        self.mapView.addAnnotation(annotation)
    }
}
