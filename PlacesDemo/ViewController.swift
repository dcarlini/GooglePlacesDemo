//
//  ViewController.swift
//  PlacesDemo
//
//  Created by julie.yaunches on 3/22/16.
//  Copyright © 2016 julie.yaunches. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        let params: [String:AnyObject] = ["key": "AIzaSyBdt7KHl07gIOeT-zshtJvh_p2nI5pDS_Y",
                                          "radius": "500",
                                          "location": "-33.8670522,151.1957362",
                                          "types": "food"]

        Alamofire.request(.GET, "https://maps.googleapis.com/maps/api/place/nearbysearch/json", parameters: params)
        .responseJSON {
            response in
            if let data = response.data {
                let json = JSON(data: data)
                print(json)
            }
        }
    }
    
}

