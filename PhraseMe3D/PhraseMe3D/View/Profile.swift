//
//  Profile.swift
//  PhraseMe3D
//
//  Created by Глеб Голощапов on 24.02.2023.
//

import SwiftUI

struct Profile: View {
    
    @State private var isPresentedSignIn = false
    @State var showAlert = false
    
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
                    showAlert.toggle()
                }
                .cornerRadius(22)
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Coming soon"), dismissButton: Alert.Button.default(Text("OK")))
                    
                })
                
                CustomButton(
                    model: CustomButton.Model(
                        type: .white,
                        title: "Change password"
                        
                    )
                ) {
                    //                        действие по тапу на кнопку
                    showAlert.toggle()
                }
                .cornerRadius(22)
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Coming soon"), dismissButton: Alert.Button.default(Text("OK")))
                })
                
            }
            
            
            Spacer()
            
            CustomButton(
                model: CustomButton.Model(
                    type: .white,
                    title: "Sign out"
                    
                )
            ) {
                //                        действие по тапу на кнопку
                UserDefaults().set(nil, forKey: "token")
                self.isPresentedSignIn.toggle()
                
            }.fullScreenCover(isPresented: $isPresentedSignIn) {
                SignIn()
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
