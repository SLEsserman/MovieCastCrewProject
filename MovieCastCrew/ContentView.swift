//
//  ContentView.swift
//  MovieCastCrew
//
//  Created by Samuel Esserman on 4/7/21.
//

import SwiftUI

struct MovieScreen: View {
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                HStack {
                    MovieCardView(color: .blue)
                        .frame(maxWidth: geo.size.width / 2, maxHeight: .infinity)
                        .padding(.top, 0)
                        .padding(.bottom, 50)
                    Spacer()
                    MovieCardView(color: .orange)
                        .frame(maxWidth: geo.size.width / 2, maxHeight: .infinity)
                        .padding(.top, 0)
                        .padding(.bottom, 50)
                }
            }
        }
    }
}

struct MovieSreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieScreen()
    }
}
