//
//  MessageListView.swift
//  keysCustomKeyboardChallenge
//
//  Created by Bryan A Bolivar M on 27/07/22.
//

import SwiftUI

struct MessageListView: View {
    var model: Category?
    var tappedCallback: ((String) -> Void)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack {
                if model != nil {
                    ForEach(model!.subcategories) { person in
                        Button {
                            tappedCallback(person.name)
                        } label: {
                            Text(person.name)
                                .modifier(ContentModifier())
                        }
                        Divider()
                    }
                }
            }
        }
    }
}

fileprivate struct ContentModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.callout)
            .foregroundColor(.primary)
            .padding(10)
    }
}
