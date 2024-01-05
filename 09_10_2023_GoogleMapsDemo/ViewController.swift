//
//  ViewController.swift
//  09_10_2023_GoogleMapsDemo
//
//  Created by Vishal Jagtap on 05/01/24.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet weak var googleMapView: GMSMapView!
    var gmsCameraPosition : GMSCameraPosition?
    var bitcodeMarker : GMSMarker? = GMSMarker(
        position: CLLocationCoordinate2D(latitude: 18.5091, longitude: 73.8326))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeSettingsForGoogleMaps()
        initializeCameraSettings()
    }
    
    func initializeCameraSettings(){
       gmsCameraPosition = GMSCameraPosition(target: bitcodeMarker!.position, zoom: 20.0)
        bitcodeMarker?.snippet = "Bitcode"
        bitcodeMarker?.rotation = 45.0
        bitcodeMarker?.opacity = 1
        //bitcodeMarker?.icon = UIImage(named: "flag")
        bitcodeMarker?.isDraggable = true
        bitcodeMarker?.title = "IT Training"
        bitcodeMarker?.zIndex = 5
        bitcodeMarker?.map = googleMapView
        googleMapView.camera = gmsCameraPosition!
    }

    func initializeSettingsForGoogleMaps(){
        googleMapView.settings.myLocationButton = true
        googleMapView.settings.compassButton = true
        googleMapView.settings.zoomGestures = true
        googleMapView.settings.rotateGestures = true
        googleMapView.settings.scrollGestures = true
        googleMapView.settings.tiltGestures = true
        googleMapView.isBuildingsEnabled = true
        googleMapView.isTrafficEnabled = true
        googleMapView.isMyLocationEnabled = true
        googleMapView.mapType = .normal
    }
}

extension ViewController : GMSMapViewDelegate{
    
}
