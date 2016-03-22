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
}

class PlaceJSONParser: NSObject {
    static func createFrom(incomingJSON: SwiftyJSON.JSON) -> [Place] {
        var resultPlaces: [Place] = []

        let jsonPlaces = incomingJSON["results"].array

        for subJSON in jsonPlaces! {
            if let name = subJSON["name"].rawString() {
                resultPlaces.append(Place(name: name))
            }

        }
        return resultPlaces
    }
}