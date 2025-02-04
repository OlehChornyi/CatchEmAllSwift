//
//  ContentView.swift
//  CatchEmAllSwift
//
//  Created by Oleh on 04.02.2025.
//

import SwiftUI

struct CreaturesListView: View {
    var creatures = ["Pikachu"]
    var body: some View {
        NavigationStack {
            List(creatures, id: \.self) { creature in
                Text(creature)
                    .font(.title2)
            }
            .listStyle(.plain)
            .navigationTitle("Pokemon")
        }
    }
}

#Preview {
    CreaturesListView()
}
