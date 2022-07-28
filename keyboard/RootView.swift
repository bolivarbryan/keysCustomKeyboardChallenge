//
//  RootView.swift
//  keyboard
//
//  Created by John Peterson on 5/10/22.
//

import SwiftUI

struct RootView: View {
    var tappedCallback: ((String) -> Void)

    var body: some View {
        ContentView(tappedCallback: tappedCallback)
            .frame(height: 260)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView { text in
            print(text)
        }
    }
}
