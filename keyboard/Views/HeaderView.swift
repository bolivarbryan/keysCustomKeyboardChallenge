//
//  HeaderView.swift
//  keysCustomKeyboardChallenge
//
//  Created by Bryan A Bolivar M on 27/07/22.
//

import SwiftUI

struct HeaderView: View {
    var model: [Category]
    var tappedCallback: ((Category) -> Void)
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(model) { person in
                    Button {
                        tappedCallback(person)
                    } label: {
                        Text(person.name)
                            .modifier(HeaderItemModifier(color: .white))
                    }
                    .padding(.leading)
                }
            }
        }
    }
}

fileprivate struct HeaderItemModifier: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.callout)
            .foregroundColor(.black)
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 8).fill(color))
    }
}
