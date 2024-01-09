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
    var delhiPosition : CLLocationCoordinate2D?
    var bitcodeMarker : GMSMarker?
    var delhiMarker : GMSMarker?
    var gmsCircle : GMSCircle?
    var radiusOfCircle : CLLocationDistance?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bitcodeMarker = GMSMarker(
            position: CLLocationCoordinate2D(latitude: 18.5091, longitude: 73.8326))
        
        delhiPosition = CLLocationCoordinate2D(latitude: 28.7041, longitude: 77.1025)
        delhiMarker = GMSMarker(position: delhiPosition!)
        
        initializeSettingsForGoogleMaps()
        initializeMarker(marker: delhiMarker!)
        initializeMarker(marker: bitcodeMarker!)
        settingCameraPosition(position: bitcodeMarker!.position)
        drawCircleOnMap(position: bitcodeMarker!.position, radius: 20.0)
//        drawPolygonOnMap()
//        drawPolylineOnMap()
    }
    
    func initializeMarker(marker : GMSMarker){
        marker.snippet = "Bitcode Tech"
        marker.rotation = 45.0
        marker.opacity = 1
        //bitcodeMarker?.icon = UIImage(named: "flag")
        marker.isDraggable = true
        marker.title = "Bitcode"
        marker.zIndex = 5
        marker.map = googleMapView
    }
    
    func settingCameraPosition(position : CLLocationCoordinate2D){
        gmsCameraPosition = GMSCameraPosition(target : position, zoom: 20.0)
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
    
    func drawCircleOnMap(position : CLLocationCoordinate2D, radius : CLLocationDistance){
        gmsCircle = GMSCircle(
            position: position,
            radius: radius)
        gmsCircle?.zIndex = 10
        gmsCircle?.title = "Bitcode Tech"
        gmsCircle?.fillColor = .lightGray
        gmsCircle?.strokeColor = .brown
        gmsCircle?.strokeWidth = 5.0
        gmsCircle?.map = googleMapView
    }
    
//    func drawPolygonOnMap(){
//
//    }
//
//    func drawPolylineOnMap(){
//
//    }
}

extension ViewController : GMSMapViewDelegate{
    
}
