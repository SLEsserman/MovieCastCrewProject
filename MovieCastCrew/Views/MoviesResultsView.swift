//
//  MoviesResultsView.swift
//  MovieCastCrew
//
//  Created by Samuel Esserman on 4/23/21.
//

import SwiftUI

struct MoviesResultsView: View {
    
    let color: Color
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(color)
                Text("Cast and Crew incommon")
            }
        }
    }
}
