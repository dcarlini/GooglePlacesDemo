//
//  PlacesTableViewController.swift
//  PlacesDemo
//
//  Created by julie.yaunches on 3/22/16.
//  Copyright © 2016 julie.yaunches. All rights reserved.
//

import Foundation
import UIKit

class PlacesTableViewController: UITableViewController {
    var places: [Place]?

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.places?.count ?? 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PlaceCell") as UITableViewCell!

        if let places = places {
            let place = places[indexPath.row]
            cell.textLabel?.text = place.name + " \(place.rating)"
            
            
        }
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("cell tapped")
        print(indexPath)
        
        
        if let places = places {
            let place = places[indexPath.row]
            print("selected place " + "\(place) " )
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: NSBundle(forClass: self.dynamicType))
            if let detailsVC = storyboard.instantiateViewControllerWithIdentifier("DetailsViewController") as?
                DetailsViewController {
                detailsVC.place = place
                self.navigationController?.pushViewController(detailsVC, animated: true)
            }
            
        }
    }

}
