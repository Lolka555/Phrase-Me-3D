//
//  CustomTextField.swift
//  PhraseMe3D
//
//  Created by Глеб Голощапов on 07.02.2023.
//

import SwiftUI

//Кастомные поля для ввода
struct CustomTextField: View {
    
    // MARK: - Properties
    let placeholderText: String
    var isSecureField: Bool = false
    @Binding var text: String
    
    // MARK: - Body
    var body: some View {
        ZStack {
            if text.isEmpty {
                Text(placeholderText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            if isSecureField {
                SecureField("", text: $text)
            } else {
                TextField("", text: $text)
            }
        }
        .padding(.leading, 16)
        .font(.system(size: 14))
        .foregroundColor(Color("Brown"))
        .frame(height: 44)
        .overlay(RoundedRectangle(cornerRadius: 4).stroke(lineWidth: 1).foregroundColor(Color("Brown")))
    }
}

enum CustomButtonType {
    case white
    case transparent
}

