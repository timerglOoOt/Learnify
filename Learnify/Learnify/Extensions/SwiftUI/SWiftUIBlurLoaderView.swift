//
//  BlurLoaderView.swift
//  Learnify
//
//  Created by Тимур Хайруллин on 26.05.2024.
//

import SwiftUI

// MARK: - Хайруллин Тимур

struct SwiftUIBlurLoaderView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(1.5)
        }
    }
}
