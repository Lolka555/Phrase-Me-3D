//
//  Profile.swift
//  PhraseMe3D
//
//  Created by Глеб Голощапов on 24.02.2023.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("\(UserDefaults().value(forKey: "email")!)" as String)
                .foregroundColor(Color("Brown"))
                .font(.system(size: 24))
            
            Spacer()
            
            VStack(spacing: 20) {
                CustomButton(
                    model: CustomButton.Model(
                        type: .white,
                        title: "Favorite words"
                        
                    )
                ) {
                    //                        действие по тапу на кнопку
                }
                .cornerRadius(22)
                
                CustomButton(
                    model: CustomButton.Model(
                        type: .white,
                        title: "Change password"
                        
                    )
                ) {
                    //                        действие по тапу на кнопку
                }
                .cornerRadius(22)
                
            }
            
            
            Spacer()
            
            CustomButton(
                model: CustomButton.Model(
                    type: .white,
                    title: "Sign out"
                    
                )
            ) {
                //                        действие по тапу на кнопку
            }
            
            Spacer()
            
            
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Yellow").ignoresSafeArea())
        .navigationTitle("Profile")
        .navigationBarTitleTextColor(Color("Brown"))
        .navigationBarColor(Color("Yellow"))
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
