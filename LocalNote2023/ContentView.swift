//
//  ContentView.swift
//  LocalNote2023
//
//  Created by Ingo Wiederoder on 25.06.23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
//    @State var addable = Bool.random()
    @State var addable = true
    @State var showSheet = false
    @State var coordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.457878, longitude: 13.526298), latitudinalMeters: 100, longitudinalMeters: 100)
    var body: some View {
        VStack {
            HeadlineView(titleText: "LocalNote")
            .padding()
//            Spacer()
            Map(coordinateRegion: $coordinateRegion)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .padding()
                .frame(minWidth: 380, maxHeight: 420)
            Spacer()
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 44, height: 44)
                .foregroundColor(addable == true ? .blue : .gray)
                .padding(.top)
                .onTapGesture() {
                    if addable {
                        showSheet = true
                    }
                    addable.toggle()
                }
            Spacer()
        }
        .sheet(isPresented: $showSheet) {
            Text("Show Sheet")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
