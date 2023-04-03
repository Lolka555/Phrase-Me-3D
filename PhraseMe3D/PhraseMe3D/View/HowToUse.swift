//
//  ContentView.swift
//  SlidingIntroScreen
//
//  Created by Federico on 18/03/2022.
//

import SwiftUI

struct HowToUse: View {
    
    @State private var pageIndex = 0
    @State private var isPresentedSignUp = false
    
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        TabView(selection: $pageIndex) {
            ForEach(pages) { page in
                VStack {
                    Spacer()
                    PageView(page: page)
                    Spacer()
                    if page == pages.last {
                        HStack(spacing: 20) {
                            Button("Prev", action: dicrementPage)
                                .buttonStyle(.borderedProminent)
                            Button("Start") {
                                isPresentedSignUp.toggle()
                                UserDefaults().set(true, forKey: "howToUse")
                                
                            }.buttonStyle(.bordered)
                                .fullScreenCover(isPresented: $isPresentedSignUp) {
                                    SignUp()
                                }
                        }
                            
                    } else {
                        HStack(spacing: 20) {
                            Button("Prev", action: dicrementPage)
                                .buttonStyle(.borderedProminent)
                            Button("Next", action: incrementPage)
                                .buttonStyle(.borderedProminent)
                        }
                    }
                    Spacer()
                }
                .tag(page.tag)
            }
        }
        .animation(.easeInOut, value: pageIndex)// 2
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .tabViewStyle(PageTabViewStyle())
        .onAppear {
            dotAppearance.currentPageIndicatorTintColor = .black
            dotAppearance.pageIndicatorTintColor = .gray
        }
    }
    
    func incrementPage() {
        pageIndex += 1
    }
    
    func dicrementPage() {
        pageIndex -= 1
    }
    
    func goToZero() {
        pageIndex = 0
    }

}

struct HowToUse_Previews: PreviewProvider {
    static var previews: some View {
        HowToUse()
    }
}
