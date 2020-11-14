//
//  Map.swift
//  Cheech
//
//  Created by Артур on 02.10.2020.
//

import CoreLocation
import MapKit
import SwiftUI

struct Map: View {
    
    
    @State private var showDirections = false
    @State var manager = CLLocationManager()
    @State var alert = false

    
    var body: some View {
        
        VStack {
            
            VStack(spacing: 5){
                Button(action: {
                    
                    
                }, label: {
                    Image(systemName: "location.fill")
                })
                Text("Проложить маршрут")
                    .font(.caption)
                    .fontWeight(.bold).lineLimit(1)
            }
            
            MapView(alert: self.$alert, manager: $manager, showDirection: self.$showDirections).alert(isPresented: self.$alert){
                
                Alert(title: Text("Пожалуйста, включите геолокацию в настройках"))
            }
            .edgesIgnoringSafeArea(.all)
            
            
            
            
            
            
        }
    }
}

struct MapView: UIViewRepresentable {
  typealias UIViewType = MKMapView
  
    @Binding var alert : Bool
    @Binding var manager : CLLocationManager
    @Binding var showDirection : Bool
    
    let map = MKMapView()
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent1: self)
    }
  
    func makeUIView(context: Context) -> MKMapView {
        
        
        if alert {
        
           
            let region = MKCoordinateRegion(center: manager.location!.coordinate, latitudinalMeters: 4000, longitudinalMeters: 4000)
                map.region = region
        }
        else {
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 54.72744856, longitude: 55.943335), latitudinalMeters: 4000, longitudinalMeters: 4000)
            map.region = region
        }
        
        
        
        let p1 = MKPointAnnotation()
                p1.coordinate = CLLocationCoordinate2D(latitude: manager.location?.coordinate.latitude ?? 54.72744856 , longitude: manager.location?.coordinate.longitude ?? 55.943335)
                p1.title = "Вы Здесь"
                map.addAnnotation(p1)
        
        let p2 = MKPointAnnotation()
                p2.coordinate = CLLocationCoordinate2D(latitude: 54.72744856, longitude: 55.943335)
                p2.title = "Cheech&Chong"
                map.addAnnotation(p2)
        



     

        
        
        
        map.delegate = context.coordinator
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        map.showsUserLocation = true
       
        
    return map
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
    
    
   
    uiView.delegate = context.coordinator
        

    let request = MKDirections.Request()
      request.source = MKMapItem(placemark: (MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: manager.location?.coordinate.latitude ?? 54.72744856 , longitude: manager.location?.coordinate.longitude ?? 55.943335))))
          request.destination = MKMapItem(placemark:(MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: 54.72744856, longitude: 55.943335))) )
          request.transportType = .automobile

          let directions = MKDirections(request: request)
          directions.calculate { response, error in
              guard let route = response?.routes.first else { return }
             
              map.addOverlay(route.polyline)
              map.setVisibleMapRect(
                  route.polyline.boundingMapRect,
                  edgePadding: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5),
                  animated: true)
              _ = route.steps.map { $0.instructions }.filter { !$0.isEmpty }
          }
    
    
  }
  
  class Coordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var parent : MapView
    
    init(parent1 : MapView){
        parent = parent1
    }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
      let renderer = MKPolylineRenderer(overlay: overlay)
        
      renderer.strokeColor = .orange
      renderer.lineWidth = 5
        
      return renderer
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .denied{
            parent.alert.toggle()
        }
    }
    
  }
    
}

struct Map_Previews: PreviewProvider {
  static var previews: some View {
    Map()
  }
}



