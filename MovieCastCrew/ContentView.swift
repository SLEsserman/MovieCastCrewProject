//
//  ContentView.swift
//  MovieCastCrew
//
//  Created by Samuel Esserman on 4/7/21.
//

import SwiftUI

struct MovieScreen: View {
    
    var body: some View {
        HStack {
            GeometryReader { geo in
                MovieCardView()
                    .frame(maxWidth: geo.size.width / 2, maxHeight: .infinity)
                    .padding(.top, 0)
                    .padding(.bottom, 50)
            }
        }
    }
}

struct MovieSreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieScreen()
    }
}
