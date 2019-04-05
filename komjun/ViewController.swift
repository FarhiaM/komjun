//
//  ViewController.swift
//  komjun
//
//  Created by Farhia Mohamed on 2019-03-30.
//  Copyright © 2019 Komjun. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var fab: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    var resultSearchController: UISearchController!
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fab.layer.cornerRadius = 30
        fab.layer.masksToBounds = true
        fab.layer.zPosition = 1
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Search bar clicked")
        UIApplication.shared.beginIgnoringInteractionEvents()
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text
        let activeSearch = MKLocalSearch(request: searchRequest)
        activeSearch.start{ (response, error) in
            if response == nil {
                print("ERROR!")
            } else {
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                let annotation = MKPointAnnotation()
                annotation.title = searchBar.text
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                self.mapView.addAnnotation(annotation)
                
            }
        }
        
    }
    
    @IBAction func newReportPressed() {
        print("Button pressed!!")
    }


}

