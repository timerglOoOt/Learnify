//
//  SwiftUICustomSwitchLabel.swift
//  Learnify
//
//  Created by Тимур Хайруллин on 26.05.2024.
//
import SwiftUI

// MARK: - Хайруллин Тимур

struct SwiftUICustomSwitchLabel: View {
    let text: String
    @Binding var isOn: Bool
    let isEnabled: Bool
    let action: () -> Void

    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(Color("standartTextColor"))
                .padding(.leading, 8)
            Spacer()
            Toggle("", isOn: $isOn)
                .disabled(!isEnabled)
                .onChange(of: isOn, perform: { _ in
                    action()
                })
        }
        .frame(height: 40)
    }
}
