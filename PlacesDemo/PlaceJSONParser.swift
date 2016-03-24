//
//  PlaceJSONParser.swift
//  PlacesDemo
//
//  Created by julie.yaunches on 3/22/16.
//  Copyright © 2016 julie.yaunches. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Place {
    var name: String
    var rating : Double
    var locationLongitude : Double
    var locationLatitude : Double
    
}

class PlaceJSONParser: NSObject {
    static func createFrom(incomingJSON: SwiftyJSON.JSON) -> [Place] {
        var resultPlaces: [Place] = []

        let jsonPlaces = incomingJSON["results"].array

        for subJSON in jsonPlaces! {
            
            
            if let name = subJSON["name"].rawString(),
                let rating = subJSON["rating"].double ,
                let location = subJSON["geometry"]["location"].dictionaryObject
            {
                
                
                if let longitude = location["lng"]?.doubleValue,
                   let latitude = location["lat"]?.doubleValue {
                        print(longitude)
                        print(latitude)
                    let place = Place(name:name, rating:rating, locationLongitude:longitude, locationLatitude:latitude)
                
                    resultPlaces.append(place)
                    print(place)
                }

            }
        }
        return resultPlaces
    }
}