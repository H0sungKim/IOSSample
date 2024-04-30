//
//  MapViewController.swift
//  IOSSample
//
//  Created by Hosung.Kim on 2023/12/28.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mvMap: MKMapView!
    @IBOutlet weak var lbInfo1: UILabel!
    @IBOutlet weak var lbInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        mvMap.showsUserLocation = true
    }

    @IBAction func sgChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            lbInfo1.text = ""
            lbInfo2.text = ""
            locationManager.startUpdatingLocation()
        } else if sender.selectedSegmentIndex == 1 {
            setAnnotation(latValue: 37.550127, longValue: 126.924851, delta: 1, title: "홍익대학교", subtitle: "마포구 와우산로")
            lbInfo1.text = "보고 계신 위치"
            lbInfo2.text = "홍익대학교"
        } else if sender.selectedSegmentIndex == 2 {
            setAnnotation(latValue: 37.468642, longValue: 126.808657, delta: 1, title: "우리집", subtitle: "부천시 범박동")
            lbInfo1.text = "보고 계신 위치"
            lbInfo2.text = "우리집"
        }
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func goLocation(latValue: CLLocationDegrees, longValue: CLLocationDegrees, delta span: Double) -> CLLocationCoordinate2D {
        let pLocation = CLLocationCoordinate2DMake(latValue, longValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: CLLocationCoordinate2DMake(latValue, longValue), span: MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span))
        mvMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let pLocation = locations.last
        _ = goLocation(latValue: (pLocation?.coordinate.latitude)!, longValue: (pLocation?.coordinate.longitude)!, delta: 0.01)
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler: {
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += ""
                address = pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            self.lbInfo1.text = "현재 위치"
            self.lbInfo2.text = address
        })
        locationManager.stopUpdatingLocation()
    }
    func setAnnotation(latValue: CLLocationDegrees, longValue: CLLocationDegrees, delta span: Double, title: String, subtitle: String) {
        for i in mvMap.annotations {
            mvMap.removeAnnotation(i)
        }
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latValue: latValue, longValue: longValue, delta: span)
        annotation.title = title
        annotation.subtitle = subtitle
        mvMap.addAnnotation(annotation)
    }
}
