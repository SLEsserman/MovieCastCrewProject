//
//  MovieScreenModel.swift
//  MovieCastCrew
//
//  Created by Samuel Esserman on 4/26/21.
//

import SwiftUI

class MovieScreenViewModel: ObservableObject {

    enum State {
        case initial
        case showFrontCard
        
        init(state1: MovieViewModel.State, state2: MovieViewModel.State) {
            switch (state1, state2) {
            case (.selection, .selection):
                self = .showFrontCard
            default:
                self = .initial
            }
        }
    }

    @Published var state: State = .initial

    lazy var cardOneViewModel: MovieViewModel = {
        MovieViewModel(onStateChange: self.updateState)
    }()
    lazy var cardTwoViewModel: MovieViewModel = {
        MovieViewModel(onStateChange: self.updateState)
    }()
    
    func updateState() {
        state = State(state1: cardOneViewModel.state, state2: cardTwoViewModel.state)
    }
}
