//
//  ViewController.swift
//  sPark
//
//  Created by Kanishka Mitra on 7/15/17.
//  Copyright © 2017 Kanishka Mitra. All rights reserved.
//

import UIKit
import Mapbox
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, MGLMapViewDelegate {
    
    var mapView: MGLMapView!
    let manager = CLLocationManager ()
    
    //current location method
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location  = locations[0]
        let _:MGLCoordinateSpan = MGLCoordinateSpanMake(0.01, 0.01)
        let _:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        self.mapView.showsUserLocation = true
        
        //big boiii
        
    }
    
    
    //points
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        //Current Location
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        //map style: stallite or street
        //mapView = MGLMapView(frame: view.bounds, styleURL: MGLStyle.satelliteStyleURL(withVersion: 9))
        mapView = MGLMapView(frame: view.bounds, styleURL: MGLStyle.darkStyleURL(withVersion: 9))
        
        
        
        //starting point = Austin
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let center = CLLocationCoordinate2D(latitude: 30.275, longitude: -97.745)
        //mapView.centerCoordinate = CLLocationCoordinate2D(latitude: 30.275, longitude: -97.745)
        mapView.setCenter(center, zoomLevel: 3, direction: 0, animated: false)
        //mapView.zoomLevel = 10
        mapView.delegate = self
        view.addSubview(mapView)
        
        
        
        
        //Parking Spaces
        
        /*
         
         //point 1 = Speedway
         let point1 = MGLPointAnnotation()
         point1.coordinate = CLLocationCoordinate2D(latitude: 30.2911696, longitude: -97.7370947)
         point1.title = "Speedway Parking Garage"
         point1.subtitle = "$12"
         mapView.addAnnotation(point1)
         //point 2 = San Jacinto
         let point2 = MGLPointAnnotation()
         point2.coordinate = CLLocationCoordinate2D(latitude: 30.28778, longitude: -97.7318076)
         point2.title = "San Jacinto Parking Garage"
         point2.subtitle = "$12"
         mapView.addAnnotation(point2)
         
         //point 3 = Brazos
         let point3 = MGLPointAnnotation()
         point3.coordinate = CLLocationCoordinate2D(latitude: 30.2810278, longitude: -97.7362203)
         point3.title = "Brazos Parking Garage"
         point3.subtitle = "$12"
         mapView.addAnnotation(point3)
         
         //point 4 = Texas Capitol
         let point4 = MGLPointAnnotation()
         point4.coordinate = CLLocationCoordinate2D(latitude: 30.2738303, longitude: -97.7374581)
         point4.title = "Texas Capital Parking Garage"
         point4.subtitle = "$12"
         mapView.addAnnotation(point4)
         
         //point 5 = Platinum
         let point5 = MGLPointAnnotation()
         point5.coordinate = CLLocationCoordinate2D(latitude: 30.268881, longitude: -97.737252)
         point5.title = "Platinum Parking Garage"
         point5.subtitle = "$12"
         mapView.addAnnotation(point5)
         
         //point 6 = Littlefield
         let point6 = MGLPointAnnotation()
         point6.coordinate = CLLocationCoordinate2D(latitude: 30.2671921, longitude: -97.7418192999999)
         point6.title = "Littlefield Parking Garage"
         point6.subtitle = "$12"
         mapView.addAnnotation(point6)
         
         //point 7 = Downtown
         let point7 = MGLPointAnnotation()
         point7.coordinate = CLLocationCoordinate2D(latitude: 30.2653256, longitude: -97.7430706999999)
         point7.title = "Downtown Parking Garage"
         point7.subtitle = "$12"
         mapView.addAnnotation(point7)
         
         //point 8 = Premium
         let point8 = MGLPointAnnotation()
         point8.coordinate = CLLocationCoordinate2D(latitude: 30.288141, longitude: -97.7269769999999)
         point8.title = "Premium Parking Garage"
         point8.subtitle = "$12"
         mapView.addAnnotation(point8)
         
         //point 9 = Capital Center
         let point9 = MGLPointAnnotation()
         point9.coordinate = CLLocationCoordinate2D(latitude: 30.2713761, longitude: -97.741107)
         point9.title = "Capital Center Parking Garage"
         point9.subtitle = "$12"
         mapView.addAnnotation(point9)
         
         //point 10 = Garage
         let point10 = MGLPointAnnotation()
         point10.coordinate = CLLocationCoordinate2D(latitude: 30.2680077, longitude: -97.7440126)
         point10.title = "Garage"
         point10.subtitle = "$12"
         mapView.addAnnotation(point10)
         */
        
        
        //Satellite Button
        //addToggleButton()
        //mapView.delegate = self
        
        addAnnotation()
        
    }
    
    //zoom motion
    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
        
        let camera = MGLMapCamera(lookingAtCenter: mapView.centerCoordinate, fromDistance: 100000, pitch: 15, heading: 360)
        
        mapView.setCamera(camera, withDuration: 3, animationTimingFunction: CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut))
    }
    
    
    //annotations
    func addAnnotation() {
        let point1 = MGLPointAnnotation()
        point1.coordinate = CLLocationCoordinate2D(latitude: 30.2911696, longitude: -97.7370947)
        point1.title = "Speedway Parking Garage"
        point1.subtitle = "$24"
        mapView.addAnnotation(point1)
        
        let point2 = MGLPointAnnotation()
        point2.coordinate = CLLocationCoordinate2D(latitude: 30.28778, longitude: -97.7318076)
        point2.title = "San Jacinto Parking Garage"
        point2.subtitle = "$12"
        mapView.addAnnotation(point2)
        
    }
    
    
    
    
    //instantiate button
    func mapView(_ mapView: MGLMapView, rightCalloutAccessoryViewFor annotation: MGLAnnotation) -> UIView? {
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 70, height: 53))
        button.backgroundColor = UIColor(hue: 61/360, saturation: 100/100, brightness: 99/100, alpha: 1.0)
        button.setTitle("Details", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }
    
    
    
    //alert
    func mapView(_ mapView: MGLMapView, annotation: MGLAnnotation, calloutAccessoryControlTapped control: UIControl) {
        // callout collapse
        mapView.deselectAnnotation(annotation, animated: false)
        
        // Shows the alert
        let alert = UIAlertController(title: annotation.title!!, message: annotation.subtitle!!, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    //the actual point
    func mapView(_ mapView: MGLMapView, viewFor annotation2: MGLAnnotation) -> MGLAnnotationView?
    {
        guard annotation2 is MGLPointAnnotation else
        {
            return nil
        }
        // reuse identitfier
        let reuseIdentifier = "\(annotation2.coordinate.longitude)"
        // reused annotation
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
        
        
        // shape = apparently a circle
        if annotationView == nil
        {
            annotationView = CustomAnnotationView(reuseIdentifier: reuseIdentifier)
            annotationView!.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
            
            //color
            annotationView!.backgroundColor = UIColor(hue: 61/360, saturation: 100/100, brightness: 99/100, alpha: 1.0)
            
            
        }
        
        return annotationView
    }
    
    
    
    
    //touch method
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool
    {
        return true
    }
    
    
    
    //point got the moves
    class CustomAnnotationView: MGLAnnotationView
    {
        override func layoutSubviews()
        {
            super.layoutSubviews()
            
            // point not changing
            scalesWithViewingDistance = false
            //forced circle
            layer.cornerRadius = frame.width / 2
            layer.borderWidth = 2
            layer.borderColor = UIColor.black.cgColor
        }
        
        override func setSelected(_ selected: Bool, animated: Bool)
        {
            super.setSelected(selected, animated: animated)
            
            // Animation of the point: isis effect
            let animation = CABasicAnimation(keyPath: "borderWidth")
            animation.duration = 0.1
            layer.borderWidth = selected ? frame.width / 3 : 2
            layer.add(animation, forKey: "borderWidth")
        }
    }
    
    
    
    
    
    
    //random shit
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    //Satellite Button
    /*
     func toggleLayer(sender: UIButton) {
     sender.isSelected = !sender.isSelected
     if sender.isSelected {
     mapView = MGLMapView(frame: view.bounds, styleURL: MGLStyle.satelliteStyleURL(withVersion: 9))
     } else {
     mapView = MGLMapView(frame: view.bounds, styleURL: MGLStyle.streetsStyleURL(withVersion: 10))
     }
     }
     func addToggleButton() {
     let button = UIButton(type: .system)
     button.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin]
     button.setTitle("Satellite", for: .normal)
     button.isSelected = true
     button.sizeToFit()
     button.center.x = self.view.center.x
     button.frame = CGRect(origin: CGPoint(x: button.frame.origin.x, y: self.view.frame.size.height - button.frame.size.height - 5), size: button.frame.size)
     button.addTarget(self, action: #selector(ViewController.toggleLayer(sender:)), for: .touchUpInside)
     self.view.addSubview(button)
     self.view.bringSubview(toFront: button)
     
     }
     
     */
    
    
    
    
    
}

