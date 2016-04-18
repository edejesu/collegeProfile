//
//  MapViewController.swift
//  college profile builder
//
//  Created by edejesu on 2/18/16.
//  Copyright © 2016 edejesu. All rights reserved.
//

import UIKit

import MapKit
import CoreLocation



class MapViewController: UIViewController,  CLLocationManagerDelegate, MKMapViewDelegate

{

    @IBOutlet weak var myMapView: MKMapView!
    @IBOutlet weak var myTextField: UITextField!
    let college : [CollegeClass] = []
    var coords = [42.02, 93.65]
    var names = ["iowa state"]
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    @IBAction func searchButtonTapped(sender: UIButton)
    {
        geoCodeLocation(myTextField.text!)
        myTextField.resignFirstResponder()
    }

    func geoCodeLocation (Location: String)
    {
        let myGeocode = CLGeocoder()
        myGeocode.geocodeAddressString(Location) { (placeMarks, error) -> Void in
            if error != nil
            {
                print("error")
            }
            else
            {
                self.displayMap((placeMarks?.first)! as CLPlacemark)
            }
        }
    }
    func displayMap (MyPLacemark : CLPlacemark)
    {
        let myPin = MKPointAnnotation()
        myTextField.text = MyPLacemark.name
        let myLocation = MyPLacemark
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake((myLocation.location?.coordinate)!, span)
        myMapView.setRegion(region, animated: true)
        myPin.coordinate = (myLocation.location?.coordinate)!
        myPin.title = MyPLacemark.name
        myMapView.addAnnotation(myPin)
    }
    func setCenterOfMap(Location: CLLocationCoordinate2D)
    {
        let mySpan = MKCoordinateSpan(latitudeDelta: 0.007, longitudeDelta: 0.007)
        let myRegion = MKCoordinateRegion(center: Location, span: mySpan)
        myMapView.setRegion(myRegion, animated: true)
    }
}



