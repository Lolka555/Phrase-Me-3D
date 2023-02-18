//
//  SignIn.swift
//  PhraseMe3D
//
//  Created by Глеб Голощапов on 05.02.2023.
//

import SwiftUI

// View для экрана регистрации
struct SignIn: View {
    
    @StateObject var SignInVM = SignInViewModel()
    
    @State private var email = ""
    @State private var password = ""
    
    @State var showAlert = false
    @State var message = ""
    
    @State private var isPresentedSignUp = false
    @State private var isPresentedWords = false
    
    var body: some View {
        
        VStack {
            Spacer()
            Image("Logo")
            Spacer()
            
            VStack(spacing: 20) {
                CustomTextField(placeholderText: "E-mail", text: $email)
                CustomTextField(placeholderText: "Password", isSecureField: true, text: $password)
                
            }
            .padding()
            
            Spacer()
            
            VStack(spacing: 20) {
                CustomButton(
                    model: CustomButton.Model(
                        type: .white,
                        title: "Sign In"
                    )
                ) {
                    if email != "" && password != "" {
                        SignInVM.SignInAction(email: email, password: password) {answer, error in
                            if answer != "" {
                                print("POBEDA")
                                isPresentedWords.toggle()
                            } else if !error.isEmpty {
                                message = "Wrong email or password"
                                showAlert.toggle()
                            }
                        }
                    } else {
                        message = "Fill the gaps"
                        showAlert.toggle()
                        
                    }
                }
                .fullScreenCover(isPresented: $isPresentedWords) {
                    Words()
                }
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Error"), message: Text(message), dismissButton: Alert.Button.default(Text("OK")))
                    
                })
                
                CustomButton(
                    model: CustomButton.Model(
                        type: .transparent,
                        title: "Sign Up"
                    )
                ) {
                    isPresentedSignUp = true
                }
                .fullScreenCover(isPresented: $isPresentedSignUp) {
                    SignUp()
                }
            }
            .padding()
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Yellow"))
    }
}


struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
