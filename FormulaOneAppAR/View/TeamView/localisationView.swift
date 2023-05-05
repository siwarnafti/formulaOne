//
//  localisationView.swift
//  FormulaOneAppAR
//
//  Created by Siwar Nafti on 30/4/2023.
//
import MapKit
import SwiftUI
struct localisationView: View {
    
    struct aa: Identifiable {
        let id = UUID()
        // other properties
    }
    @State private var region = MKCoordinateRegion()
    var tt = [aa]()
    var base:String
    var body: some View {
        
        
        Map(coordinateRegion: $region, annotationItems: tt) { pointer in
            MapPin(coordinate: region.center,tint: .red)
//            MapMarker(coordinate: region.center,tint: .red)
        }
//        .frame(height: 700)
        .onAppear {
            setRegion()
        }
        
        Spacer()
    }
    
    
    private func setRegion() {
              let geocoder = CLGeocoder()
           geocoder.geocodeAddressString(base) { placemarks, error in
                  guard let placemark = placemarks?.first, let location = placemark.location else {
                      return
                  }
                  region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
              }
          }
}

struct localisationView_Previews: PreviewProvider {
    static var previews: some View {
        localisationView(tt:[], base: "Bahrain")
    }
}



