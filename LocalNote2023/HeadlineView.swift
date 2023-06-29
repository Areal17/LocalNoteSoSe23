//
//  HeadlineView.swift
//  LocalNote2023
//
//  Created by Ingo Wiederoder on 29.06.23.
//

import SwiftUI

struct HeadlineView: View {
    var body: some View {
        HStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.black)
            Text("LocalNote")
                .font(.title)
        }
        .padding(.horizontal)
        .background(Color(red: 0.9, green: 0.9, blue: 0.1))
        .clipShape(RoundedRectangle(cornerRadius: 12.0))
    }
}

struct HeadlineView_Previews: PreviewProvider {
    static var previews: some View {
        HeadlineView()
    }
}
