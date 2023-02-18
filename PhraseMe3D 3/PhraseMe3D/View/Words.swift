//
//  Words.swift
//  PhraseMe3D
//
//  Created by Глеб Голощапов on 08.02.2023.
//

import SwiftUI

//View для экрана со словами
struct Words: View {
    
    let li: [String] = ["Look up", "Work out", "1", "1"]
    @State private var isPresentedARScreen = false
    
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false ) {
                VStack(spacing: 20) {
                    ForEach(0..<li.count, id: \.self) { i in
                        
                        CustomButton(
                            model: CustomButton.Model(
                                type: .white,
                                title: "\(li[i])",
                                cornerRadius: 22,
                                showArrow: true
                            )
                        ) {
                            // действие по тапу на кнопку
                            
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
        }
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
