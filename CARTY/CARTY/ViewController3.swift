//
//  ViewController3.swift
//  CARTY
//
//  Created by Ammar AlTahhan on 28/09/2018.
//  Copyright © 2018 Ammar AlTahhan. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController3: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    //location manager
    lazy var locationManager: CLLocationManager = {
        var _locationManager = CLLocationManager()
        _locationManager.delegate = self
        _locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        _locationManager.activityType = .automotiveNavigation
        _locationManager.distanceFilter = 10.0  // Movement threshold for new events
        //  _locationManager.allowsBackgroundLocationUpdates = true // allow in background
        
        return _locationManager
    }()
    
    var location: CLLocation?
    var head: CLLocationDirection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //allow location use
        locationManager.requestAlwaysAuthorization()
        
        print(locationManager)
        
        //get current user location for startup
        // if CLLocationManager.locationServicesEnabled() {
        locationManager.startUpdatingLocation()
        // }
        
        locationManager.startUpdatingHeading()
        
        
        Timer.scheduledTimer(withTimeInterval: 0.1
        , repeats: true) { (_) in
            if let loc = self.location, let head = self.head {
                let x2 = 15.35732551066715
                let y2 = -7.357693700240248
                let x1 = 0.0
                let y1 = 0.0
                let angle = CGFloat(self.getBearingBetweenTwoPoints1(point1: CLLocation(latitude: x1, longitude: y1), point2: CLLocation(latitude: x2, longitude: y2)))
                let rotationAngle = angle-CGFloat(head)
                self.imageView.transform = CGAffineTransform.identity.concatenating(
                    CGAffineTransform(rotationAngle: (rotationAngle*CGFloat.pi/180))
                )
                
                print(angle)
            }
        }
    }
    
    func degreesToRadians(degrees: Double) -> Double { return degrees * .pi / 180.0 }
    func radiansToDegrees(radians: Double) -> Double { return radians * 180.0 / .pi }
    
    func getBearingBetweenTwoPoints1(point1 : CLLocation, point2 : CLLocation) -> Double {
        
        let lat1 = degreesToRadians(degrees: point1.coordinate.latitude)
        let lon1 = degreesToRadians(degrees: point1.coordinate.longitude)
        
        let lat2 = degreesToRadians(degrees: point2.coordinate.latitude)
        let lon2 = degreesToRadians(degrees: point2.coordinate.longitude)
        
        let dLon = lon2 - lon1
        
        let y = sin(dLon) * cos(lat2)
        let x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon)
        let radiansBearing = atan2(y, x)
        
        return radiansToDegrees(radians: radiansBearing)
    }
}


// MARK: - CLLocationManagerDelegate
extension ViewController3: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last!
            
        print("**********************")
        print("Long \(location.coordinate.longitude)")
        print("Lati \(location.coordinate.latitude)")
        print("Alt \(location.altitude)")
        print("Sped \(location.speed)")
        print("Accu \(location.horizontalAccuracy)")
        print("**********************")
        
        self.location = location
            
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        print(newHeading.magneticHeading)
        
        self.head = newHeading.magneticHeading
    }
    
}
