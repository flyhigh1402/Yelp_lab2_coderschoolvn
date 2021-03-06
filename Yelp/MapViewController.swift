//
//  MapViewController.swift
//  Yelp
//
//  Created by huy ngo on 11/21/15.
//  Copyright © 2015 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    var annotations: [MKPointAnnotation]?
    var businesses: [Business]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // local location
        let location = CLLocationCoordinate2D(latitude: 37.785771, longitude: -122.406165)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(location, span)
        mapView.setRegion(region, animated: true)
        for business in businesses! {
            print(business.coordinate)
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: business.latitude!, longitude: business.longtitude!)
            annotation.title = business.name
            annotation.subtitle = business.categories
            mapView.addAnnotation(annotation)
        }
    }

    @IBAction func onCancleButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
