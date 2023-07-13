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


/// #NoteGenerator Class
///

class NoteGenerator: ObservableObject {
    @Published var notes = [LocalNote]()
    
    func generateNotes() {
        let countTexts = ["erste", "zweite", "dritte", "vierte", "fünfte", "sechste"]
        let coord = CLLocationCoordinate2D(latitude: 52.457878, longitude: 13.526298)
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            for countText in countTexts {
                let localNote = LocalNote(coordinate: coord, noteText: countText + " lokale Notiz")
                self.notes.append(localNote)
            }
        }
    }
}

//Test - Für die Vorlesung in ThirdLecture Branch wechseln
let coord = CLLocationCoordinate2D(latitude: 52.457878, longitude: 13.526298)

struct OverviewView: View {
    
    @StateObject var generator = NoteGenerator()
    @State private var favorite = [LocalNote]()
    @AppStorage("Favorite") var storedCounter: Int?
    var body: some View {
        NavigationStack {
            List {
                ForEach(0..<generator.notes.count, id: \.self) { idx in
                    //var note = note
                    var note = generator.notes[idx]
                    NavigationLink(note.noteText) {
                        HeadlineView(titleText: note.noteText)
                    }
//                    .background(note.isFav == true ? .blue : .gray)
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button(role: .destructive) {
                            print("gelöscht")
                        } label: {
                            Label("Löschen", systemImage: "trash")
                        }
                        Button(role: .none) {
                            note.isFav = true
                            favorite.append(note)
                            if storedCounter != nil {
                                storedCounter! += 1
                            }
                        } label: {
                            Label("Favorit", systemImage: "star")
                        }.tint(.blue)
                    }
                }
            }
            .navigationTitle("Übersicht")
            Text("Favoriten: \(storedCounter ?? 0)")
        }
        .refreshable {
            print("Refreshable")
            generator.generateNotes()
        }
    }
}

struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
