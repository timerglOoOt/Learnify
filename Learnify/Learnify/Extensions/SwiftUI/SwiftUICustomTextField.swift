//
//  SwiftUICustomTextField.swift
//  Learnify
//
//  Created by Тимур Хайруллин on 26.05.2024.
//

import SwiftUI
import UIKit

// MARK: - Хайруллин Тимур

struct SwiftUICustomTextField: View {
    @Binding var text: String
    var placeholder: String

    @State private var isEditing = false

    var body: some View {
        TextField(placeholder, text: $text, onEditingChanged: { editing in
            self.isEditing = editing
            if editing {
            } else {
            }
        })
        .font(.system(size: 22))
        .padding()
        .background(RoundedRectangle(cornerRadius: 14).stroke(isEditing ? Color.blue : Color.gray, lineWidth: 1.5))
        .overlay(
            HStack {
                Spacer()
                if !text.isEmpty {
                    Button(action: {
                        text = ""
                    }) {
                        Image(systemName: "xmark.circle")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 8)
                }
            }
        )
    }
}

extension SwiftUICustomTextField {
    @discardableResult
    func isEmptyTextField() -> Bool {
        if text.isEmpty {
            // borderColor = UIColor.hexStringToUIColor(hex: "E33A43").cgColor
        }
        return text.isEmpty
    }
}
struct CustomTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(RoundedRectangle(cornerRadius: 14).stroke(Color.gray, lineWidth: 1.5))
    }
}

extension View {
    func customTextFieldStyle() -> some View {
        self.modifier(CustomTextFieldModifier())
    }
}
