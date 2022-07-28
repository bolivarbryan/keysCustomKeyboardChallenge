//
//  ContentView.swift
//  keysCustomKeyboardChallenge
//
//  Created by Bryan A Bolivar M on 27/07/22.
//

import SwiftUI

enum NetworkState {
    case loading
    case loaded
    case error
}

struct ContentView: View {
    @StateObject private var model = ViewModel()
    @State var selectedCategory: Category?
    var tappedCallback: ((String) -> Void)
    @State var networkState: NetworkState = .loading
    
    func fetchContent() {
        model.fetchContent { error in
            if error != nil {
                networkState = .error
            } else {
                networkState = .loaded
            }
        }
    }
    
    var loadingContentView: some View {
        VStack {
            ProgressView(label: {
                Text("Fetching Messages...")
            })
        }.onAppear {
           fetchContent()
        }
    }
    
    var loadedContentView: some View {
        VStack {
            Spacer()
            HeaderView(model: model.fruits) { category in
                selectedCategory = category
            }

            MessageListView(model: selectedCategory,
                            tappedCallback: tappedCallback)
        }
    }
    
    var errorView: some View {
        VStack {
            Text("Error")
            Button {
                networkState = .loading
            } label: {
                Text("Retry?")
            }

        }
    }
    
    var body: some View {
        switch networkState {
        case .loading:
          loadingContentView
        case .loaded:
            loadedContentView
        case .error:
            errorView
        }
    }
}
