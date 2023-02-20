//
//  Words.swift
//  PhraseMe3D
//
//  Created by Глеб Голощапов on 08.02.2023.
//

import SwiftUI

//View для экрана со словами
struct Words: View {
    
    var ud = UserDefaults()
    
    @StateObject var selectedVerb = globalVerb()
    @StateObject private var viewModel = WordsViewModel()
    @State private var isPresentedARScreen = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false ) {
                VStack(spacing: 20) {
                    ForEach(viewModel.verbs, id: \.self) { i in
                        
                        CustomButton(
                            model: CustomButton.Model(
                                type: .white,
                                title: "\(i.word)",
                                cornerRadius: 22,
                                showArrow: true
                            )
                        ) {
                            print("Debug: \(i)")
                            selectedVerb.verb = "\(i.word)"
                            selectedVerb.verbID = "\(i.wordId)"
                            // действие по тапу на кнопку
                            print("Debug \(selectedVerb.verb)")
                            ud.set("\(selectedVerb.verb)", forKey: "verb")
                            isPresentedARScreen.toggle()
                        }
                        .background {
                            NavigationLink(isActive: $isPresentedARScreen) {
                                ARScreen()
                            } label: {
                                EmptyView()
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("Yellow").ignoresSafeArea())
            .navigationTitle("Words")
            .navigationBarTitleTextColor(Color("Brown"))
            .navigationBarColor(Color("Yellow"))
        }.accentColor(Color("Brown"))
    }
}

struct Words_Previews: PreviewProvider {
    static var previews: some View {
        Words()
    }
}

extension View {
    /// Sets the text color for a navigation bar title.
    /// - Parameter color: Color the title should be
    ///
    /// Supports both regular and large titles.
    @available(iOS 14, *)
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        
        // Set appearance for both normal and large sizes.
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        
        return self
    }
    
    @available(iOS 14, *)
    func navigationBarColor(_ color: Color) -> some View {
        UINavigationBar.appearance().barTintColor = UIColor(color.opacity(1))
        UINavigationBar.appearance().backgroundColor = UIColor(color)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        return self
    }
}
