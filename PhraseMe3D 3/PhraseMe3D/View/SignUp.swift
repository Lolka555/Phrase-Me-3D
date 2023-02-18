//
//  SignIn.swift
//  PhraseMe3D
//
//  Created by Глеб Голощапов on 05.02.2023.
//

import SwiftUI


//View для экрана регистрации
struct SignUp: View {
    
    @StateObject var SignUpVM = SignUpViewModel()
    @State var showAlert = false
    @State var message = ""
    
    @State private var Username = ""
    @State private var Email = ""
    @State private var Password = ""
    @State private var RePassword = ""
    
    @State private var isPresentedSignIn = false
    
    var body: some View {
        
        VStack {
            Spacer()
            Image("Logo")
            Spacer()
            
            VStack(spacing: 20) {
                CustomTextField(placeholderText: "Username", text: $Username)
                CustomTextField(placeholderText: "E-mail", text: $Email)

                CustomTextField(placeholderText: "Password", isSecureField: true, text: $Password)
                CustomTextField(placeholderText: "RePassword", isSecureField: true, text: $RePassword)
                
            }
            .padding()
            
            Spacer()
            
            VStack(spacing: 20) {
                CustomButton(
                    model: CustomButton.Model(
                        type: .white,
                        title: "Sign Up"
                    )
                ) {
                    if Email != "" && Password != "" && RePassword != "" && Username != "" {
                        
                        if Password != RePassword {
                            message = "Passwords do not match"
                            showAlert.toggle()
                        } else {
                            SignUpVM.SignUpAction(email: Email, password: Password, username: Username) {answer, error in
                                if answer != "" {
                                    print("POBEDA")
                                    isPresentedSignIn.toggle()
                                } else if !error.isEmpty {
                                    message = "Неверный логин или пароль"
                                    showAlert.toggle()
                                }
                            }
                            
                        }
                        
                    } else {
                        message = "Fill the gaps"
                        showAlert.toggle()
                        
                    }
                }.fullScreenCover(isPresented: $isPresentedSignIn) {
                    SignIn()
                }
                .alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Error"), message: Text(message), dismissButton: Alert.Button.default(Text("OK")))
                    
                })
                
                CustomButton(
                    model: CustomButton.Model(
                        type: .transparent,
                        title: "I already have an account"
                    )
                ) {
                    isPresentedSignIn.toggle()
                }
                .fullScreenCover(isPresented: $isPresentedSignIn) {
                    SignIn()
                }
            }
            .padding()
            
            
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Yellow"))
    }
}


struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
