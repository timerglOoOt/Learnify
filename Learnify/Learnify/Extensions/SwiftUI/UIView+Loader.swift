//
//  UIView+Loader.swift
//  Learnify
//
//  Created by Тимур Хайруллин on 26.05.2024.
//

import UIKit
import SwiftUI

// MARK: - Хайруллин Тимур

extension UIView {
    func showBlurLoader() {
        let hostingController = UIHostingController(rootView: SwiftUIBlurLoaderView())
        hostingController.view.frame = self.bounds
        hostingController.view.backgroundColor = .clear
        self.addSubview(hostingController.view)
        objc_setAssociatedObject(self, &loaderHandle, hostingController, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

    func removeBlurLoader() {
        if let hostingController = objc_getAssociatedObject(self, &loaderHandle) as? UIHostingController<SwiftUIBlurLoaderView> {
            hostingController.view.removeFromSuperview()
            objc_setAssociatedObject(self, &loaderHandle, nil, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

private var loaderHandle: UInt8 = 0

