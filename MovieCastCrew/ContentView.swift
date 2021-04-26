//
//  ContentView.swift
//  MovieCastCrew
//
//  Created by Samuel Esserman on 4/7/21.
//

import SwiftUI

struct MovieScreen: View {

    @ObservedObject var viewModel = MovieScreenViewModel()

    var body: some View {
        VStack {
            GeometryReader { geo in
                ZStack {
                    HStack {
                        MovieCardView(viewModel: viewModel.cardOneViewModel, color: .blue)
                            .frame(maxWidth: geo.size.width / 2, maxHeight: .infinity)
                            .padding(.top, 0)
                            .padding(.bottom, 50)
                        Spacer()
                        MovieCardView(viewModel: viewModel.cardTwoViewModel, color: .orange)
                            .frame(maxWidth: geo.size.width / 2, maxHeight: .infinity)
                            .padding(.top, 0)
                            .padding(.bottom, 50)
                    }
                    Spacer()
                    switch viewModel.state {
                    case .showFrontCard:
                        VStack {
                            MoviesResultsView(color: .red)
                                .frame(width: geo.size.width / 1.5, height: geo.size.height)
                                .offset(y: 700)
                        }
                    default:
                        VStack { }
                    }
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
