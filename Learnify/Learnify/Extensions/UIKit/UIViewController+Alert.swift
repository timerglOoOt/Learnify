//
//  UIViewController+Alert.swift
//  Learnify
//
//  Created by Тимур Хайруллин on 26.05.2024.
//

import Foundation
import UIKit

// MARK: - Хайруллин Тимур

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
}

extension UIViewController: AlertShowable {
    func showCustomAlertAsync(title: String, message: String) async {
        self.showAlert(title: title, message: message)
    }

    func showCustomAlert(title: String, message: String) {
        self.showAlert(title: title, message: message)
    }
}
