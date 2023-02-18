//
//  CustomButton.swift
//  PhraseMe3D
//
//  Created by Глеб Голощапов on 07.02.2023.
//

import SwiftUI

//кастомные кнопки
struct CustomButton: View {
    
    // MARK: - Properties
    let model: CustomButton.Model
    var action: () -> Void
    
    // MARK: - Body
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Text(model.title)
                    .font(.system(size: 14))
                    .foregroundColor(Color("Brown"))
                
                arrowIfNeededView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .frame(height: 44)
        .background(model.type == .white ? .white : .clear)
        .cornerRadius(model.cornerRadius)
        .overlay(border())
    }
    
    @ViewBuilder
    private func border() -> some View {
        if model.type == .transparent {
            RoundedRectangle(cornerRadius: 4)
                .stroke(lineWidth: 1)
                .foregroundColor(Color("Brown"))
        }
    }
    
    @ViewBuilder
    private func arrowIfNeededView() -> some View {
        if model.showArrow {
            Spacer()
            Image("Arrow")
        }
    }
}

extension CustomButton {
    struct Model {
        let type: CustomButtonType
        let title: String
        var cornerRadius: CGFloat = 4.0
        var showArrow: Bool = false
    }
}
