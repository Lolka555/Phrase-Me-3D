//
//  PageView.swift
//  SlidingIntroScreen
//
//  Created by Federico on 18/03/2022.
//

import SwiftUI

struct PageView: View {
    var page: Page
    
    var body: some View {
        VStack(spacing: 10) {
//            Text(UIDevice.current.name)
            
            if UIDevice.current.name == "iPhone 8" || UIDevice.current.name == "iPhone 7"  || UIDevice.current.name == "iPhone SE (2nd generation)" || UIDevice.current.name == "iPhone SE (3rd generation)"{
                Image("\(page.imageUrl)")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding()
                    .cornerRadius(30)
                    .background(.gray.opacity(0.10))
                    .cornerRadius(10)
                    .padding()
            } else {
                Image("\(page.imageUrl)")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 400)
                    .padding()
                    .cornerRadius(30)
                    .background(.gray.opacity(0.10))
                    .cornerRadius(10)
                    .padding()

            }
                        
            Text(page.name)
                .font(.title)
            Text(page.description)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .frame(width: 300)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(page: Page.samplePage)
    }
}
