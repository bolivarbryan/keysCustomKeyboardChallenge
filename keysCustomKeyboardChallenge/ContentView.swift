//
//  ContentView.swift
//  keysCustomKeyboardChallenge
//
//  Created by John Peterson on 5/9/22.
//

import SwiftUI

struct Category: Identifiable {
    let id = UUID()
    let name: String
    let subcategories: [Subcategory]
}

struct Subcategory: Identifiable {
    let id = UUID()
    let name: String
}

class Model: ObservableObject {
    @Published var fruits: [Category] = loadFruits()
    
    static func loadFruits() -> [Category] {
        return [
            Category(name: "Apple",
                     subcategories: [
                        Subcategory(name: "In the example above, the body property returns a concrete type of View (Text in this case). However, the type of the body property is declared as some View. This is what swift calls an Opaque Type and it saves us the trouble of having to provide the type every time. It is important to know that the type is static and the compiler knows it. However, we leave it to the compiler to figure it out instead of having to write it."),
                        Subcategory(name: "If the requirement of the view protocol is to create a body property that returns some View. When does that recursion end?"),
                        Subcategory(name: "In the example above, the body property returns a concrete type of View (Text in this case). However, the type of the body property is declared as some View. This is what swift calls an Opaque Type and it saves us the trouble of having to provide the type every time. It is important to know that the type is static and the compiler knows it. However, we leave it to the compiler to figure it out instead of having to write it."),
                        Subcategory(name: "In the example above, the body property returns a concrete type of View (Text in this case). However, the type of the body property is declared as some View. This is what swift calls an Opaque Type and it saves us the trouble of having to provide the type every time. It is important to know that the type is static and the compiler knows it. However, we leave it to the compiler to figure it out instead of having to write it."),
                        Subcategory(name: "If the requirement of the view protocol is to create a body property that returns some View. When does that recursion end?"),
                        Subcategory(name: "In the example above, the body property returns a concrete type of View (Text in this case). However, the type of the body property is declared as some View. This is what swift calls an Opaque Type and it saves us the trouble of having to provide the type every time. It is important to know that the type is static and the compiler knows it. However, we leave it to the compiler to figure it out instead of having to write it."),
                     ]
                    ),
            Category(name: "Avocado",
                     subcategories: [
                        Subcategory(name: "necesitamos un apoyo en angular "),
                        Subcategory(name: "abcde"),
                        Subcategory(name: "testing 123")
                     ]
                    ),
            Category(name: "Banana",
                     subcategories: [
                        Subcategory(name: "y eso es perjudicial"),
                        Subcategory(name: "abcde"),
                        Subcategory(name: "testing 123")
                     ]
                    ),
            Category(name: "Grapes",
                     subcategories: [
                        Subcategory(name: "Real-time meetings by Google. U"),
                        Subcategory(name: "abcde"),
                        Subcategory(name: "testing 123")
                     ]
                    ),
            Category(name: "Kiwi",
                     subcategories: [
                        Subcategory(name: "no ps termina ahí y me avisas para reunirnos"),
                        Subcategory(name: "abcde"),
                        Subcategory(name: "testing 123")
                     ]
                    ),
            Category(name: "Peach",
                     subcategories: [
                        Subcategory(name: "porque la otra seria"),
                        Subcategory(name: "abcde"),
                        Subcategory(name: "testing 123")
                     ]
                    ),
        ]
    }
}

struct ContentView: View {
    
    @StateObject private var model = Model()
    @State var selectedCategory: Category?
    
    var body: some View {
        VStack {
            Spacer()
            ScrollView(.horizontal, showsIndicators: true) {
                HStack {
                    ForEach(model.fruits) { person in
                        Button {
                            selectedCategory = person
                        } label: {
                            Text(person.name)
                                .modifier(MyCustomModifier(color: .blue))
                        }
                    }
                }
            }
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack {
                    if selectedCategory != nil {
                        ForEach(selectedCategory!.subcategories) { person in
                            Button {
                                
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 320, height: 240))
    }
}

struct MyCustomModifier: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.callout)
            .foregroundColor(.white)
            .padding(10)
            .background(RoundedRectangle(cornerRadius: 8).fill(color))
    }
}

struct ContentModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.callout)
            .foregroundColor(.gray)
            .padding(10)
    }
}

