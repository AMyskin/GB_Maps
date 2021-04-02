//
//  ViewController.swift
//  GB_Maps
//
//  Created by Alexander Myskin on 02.04.2021.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController {

    let coordinate = CLLocationCoordinate2D(latitude: 55.728899, longitude: 37.654048)
    // Маркер:
    var marker: GMSMarker?
    var locationManager: CLLocationManager?

    @IBOutlet weak var mapView: GMSMapView!

    @IBAction func currentLocation(_ sender: UIButton) {
        locationManager?.requestLocation()
    }
    
    @IBAction func recordLocation(_ sender: UIButton) {
        locationManager?.startUpdatingLocation()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withTarget: coordinate, zoom: 16)
        mapView.camera = camera

        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.requestAlwaysAuthorization()
    }


}
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        guard let location = locations.last else { return }
        let position = GMSCameraPosition.camera(withTarget: location.coordinate, zoom: 16)
        mapView.animate(to: position)
        let marker = GMSMarker(position: location.coordinate)
        marker.map = mapView
        self.marker = marker
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

