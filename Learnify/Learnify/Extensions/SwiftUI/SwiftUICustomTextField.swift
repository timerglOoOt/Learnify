//
//  SwiftUICustomTextField.swift
//  Learnify
//
//  Created by Тимур Хайруллин on 26.05.2024.
//

import SwiftUI
import UIKit

// MARK: - Хайруллин Тимур

struct CustomTextField: UIViewRepresentable {
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextField

        init(parent: CustomTextField) {
            self.parent = parent
        }

        func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.layer.borderColor = UIColor.hexStringToUIColor(hex: "2B83FF").cgColor
        }

        func textFieldDidEndEditing(_ textField: UITextField) {
            textField.layer.borderColor = UIColor.hexStringToUIColor(hex: "B8B8B8").cgColor
        }
    }

    @Binding var text: String
    @Binding var borderColor: CGColor
    var placeholder: String

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.delegate = context.coordinator
        textField.placeholder = placeholder
        textField.font = .systemFont(ofSize: 22)
        textField.layer.cornerRadius = 14
        textField.layer.borderWidth = 1.5
        textField.layer.borderColor = UIColor.hexStringToUIColor(hex: "B8B8B8").cgColor
        textField.layer.masksToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.rightView = createClearButton(textField: textField)
        textField.rightViewMode = .always
        addLeftIndent(textField: textField, size: 20)
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        uiView.layer.borderColor = borderColor
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    @discardableResult
    func isEmptyTextField() -> Bool {
        if text.isEmpty {
            borderColor = UIColor.hexStringToUIColor(hex: "E33A43").cgColor
        }
        return text.isEmpty
    }

    private func createClearButton(textField: UITextField) -> UIButton {
        let clearButton = UIButton(type: .system)
        clearButton.setImage(UIImage(systemName: "xmark.circle"), for: .normal)
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.imageView?.contentMode = .scaleAspectFit
        clearButton.addAction(UIAction(handler: { _ in
            textField.text = ""
            text = ""
        }), for: .touchUpInside)
        clearButton.tintColor = .lightGray
        return clearButton
    }

    private func addLeftIndent(textField: UITextField, size: CGFloat) {
        let indentView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: textField.frame.height))
        textField.leftView = indentView
        textField.leftViewMode = .always
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
