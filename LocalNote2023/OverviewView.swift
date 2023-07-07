//
//  OverviewView.swift
//  LocalNote2023
//
//  Created by Ingo Wiederoder on 06.07.23.
//

import SwiftUI
import MapKit

struct LocalNote: Hashable, Identifiable {
    static func == (lhs: LocalNote, rhs: LocalNote) -> Bool {
        return lhs.noteText == rhs.noteText
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(noteText)
    }
    
    var id = UUID()
    var coordinate: CLLocationCoordinate2D
    var noteText: String
    var description: String?
    var isFav = false
    
    
}

//Test
let coord = CLLocationCoordinate2D(latitude: 52.457878, longitude: 13.526298)

struct OverviewView: View {
    
   @State private var localNotes = [LocalNote(coordinate: coord, noteText: "erste Notiz"), LocalNote(coordinate: coord, noteText: "zweite Notiz"), LocalNote(coordinate: coord, noteText: "dritte Notiz")]
    @State private var favorite = [LocalNote]()
    var body: some View {
        NavigationStack {
            List {
                ForEach(localNotes) { note in
                    var note = note
                    /*@START_MENU_TOKEN@*/Text(note.noteText)/*@END_MENU_TOKEN@*/
                        .background(note.isFav == true ? .blue : .gray)
                        .swipeActions(edge: .leading, allowsFullSwipe: false) {
                            Button(role: .destructive) {
                                print("gelöscht")
                            } label: {
                                Label("Löschen", systemImage: "trash")
                            }
                            Button(role: .none) {
                                note.isFav = true
                                favorite.append(note)
                            } label: {
                                Label("Favorit", systemImage: "star")
                            }.tint(.blue)
                        }
                        
                }
            }
            .navigationTitle("Übersicht")
            Text("Favoriten: \(favorite.count)")
        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
