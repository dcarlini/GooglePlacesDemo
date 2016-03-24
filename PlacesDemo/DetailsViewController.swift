//
//  DetailsViewController.swift
//  PlacesDemo
//
//  Created by Debbie Carlini on 3/22/16.
//  Copyright © 2016 julie.yaunches. All rights reserved.
//

import UIKit
import MapKit

class DetailsViewController: UIViewController {

    var place: Place?

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var Rating: UILabel!
    @IBOutlet weak var MapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let place = place {
            name.text = place.name
            
            NSNumber(double: place.rating).stringValue
            
            Rating.text = "\(place.rating)"
            
            let location = CLLocationCoordinate2D(
                latitude: place.locationLatitude,
                longitude: place.locationLongitude
            )
            
            
           // let span = MKCoordinateSpanMake(1, 1)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
            
            let region = MKCoordinateRegion(center: location, span: span)
            
            MapView.setRegion(region, animated: true)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            
            MapView.addAnnotation(annotation)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
