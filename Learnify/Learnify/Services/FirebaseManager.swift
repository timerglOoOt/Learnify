//
//  FirebaseManager.swift
//  Learnify
//
//  Created by Тимур Хайруллин on 26.05.2024.
//

import Foundation
import Firebase
import UIKit
import FirebaseAuth

// MARK: - Хайруллин Тимур

protocol AlertShowable {
    func showCustomAlertAsync(title: String, message: String) async
    func showCustomAlert(title: String, message: String)
}

class FirebaseManager {
    private let dataBase = Firestore.firestore()
    private var alertShowable: AlertShowable?

    init(alertShowable: AlertShowable?) {
        self.alertShowable = alertShowable
    }

    func createUser(user: User, password: String) async -> String? {
        do {
            let authResult = try await Auth.auth().createUser(withEmail: user.email, password: password)
            let uid = authResult.user.uid
            try await authResult.user.sendEmailVerification()

            let userData: [String: Any] = [
                "firstName": user.firstname,
                "surname": user.surname,
                "email": user.email,
                "commentCount": user.commentCount,
                "info": user.info ?? "",
                "booksId": user.booksId
            ]

            try await dataBase.collection("users").document(uid).setData(userData)
            print("User created successfully with authentication.")
            return uid
        } catch {
            print("Error creating user with authentication: \(error.localizedDescription)")
            await alertShowable?.showCustomAlertAsync(title: "Error", message: "Error creating user with authentication: \(error.localizedDescription)")
        }
        return ""
    }

    func signInUser(email: String?, password: String?) async -> String {
        guard let email = email, let password = password else {
            print("Found empty textField!")
            await alertShowable?.showCustomAlertAsync(title: "Error", message: "Found empty textField!")
            return ""
        }
        do {
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            print("User signed in successfully with email: \(authResult.user.email ?? "")")
            return authResult.user.uid
        } catch {
            print("Error signing in user: \(error.localizedDescription)")
            await alertShowable?.showCustomAlertAsync(title: "Error", message: "Error signing in user: \(error.localizedDescription)")
        }
        return ""
    }

    func getUser(withId id: String) async -> User? {
        do {
            let document = try await dataBase.collection("users").document(id).getDocument()
            guard let data = document.data() else {
                return nil
            }
            return parseUserData(data: data)
        } catch {
            print("Error fetching user: \(error.localizedDescription)")
            await alertShowable?.showCustomAlertAsync(title: "Error", message: "Error fetching user: \(error.localizedDescription)")
            return nil
        }
    }

    func deleteUser(withId id: String) async {
        do {
            try await dataBase.collection("users").document(id).delete()
            print("User deleted successfully.")
        } catch {
            print("Error deleting user: \(error.localizedDescription)")
            await alertShowable?.showCustomAlertAsync(title: "Error", message: "Error deleting user: \(error.localizedDescription)")
        }
    }

    func addBook(toUserId userId: String, bookId: String) async {
        let bookData: [String: String] = ["id": bookId]

        do {
            try await dataBase.collection("users").document(userId).updateData([
                "cards": FieldValue.arrayUnion([bookData])
            ])
            print("Card added to user successfully.")
        } catch {
            print("Error adding card to user: \(error.localizedDescription)")
            await alertShowable?.showCustomAlertAsync(title: "Error", message: "Error adding card to user: \(error.localizedDescription)")
        }
    }

    func removeCard(fromUserId userId: String, bookId: String) async {
        let bookData: [String: String] = ["id": bookId]

        do {
            try await dataBase.collection("users").document(userId).updateData([
                "cards": FieldValue.arrayRemove([bookData])
            ])
            print("Card removed from user successfully.")
        } catch {
            print("Error removing card from user: \(error.localizedDescription)")
            await alertShowable?.showCustomAlertAsync(title: "Error", message: "Error removing card from user: \(error.localizedDescription)")
        }
    }

    func getBooksId(forUserId userId: String) async -> [String]? {
        do {
            let document = try await dataBase.collection("users").document(userId).getDocument()
            guard let data = document.data(), let cardsData = data["booksId"] as? [[String: String]] else {
                return nil
            }
            return cardsData.compactMap { bookData -> String? in
                guard let bookId = bookData["id"] else {
                    return nil
                }
                return bookId
            }
        } catch {
            print("Error fetching cards for user: \(error.localizedDescription)")
            await alertShowable?.showCustomAlertAsync(title: "Error", message: "Error fetching cards for user: \(error.localizedDescription)")
            return nil
        }
    }

    private func parseUserData(data: [String: Any]) -> User? {
        guard let firstName = data["firstName"] as? String,
            let surname = data["surname"] as? String,
            let email = data["email"] as? String,
            let commentCount = data["commentCount"] as? Int,
            let booksData = data["booksId"] as? [String] else {
            return nil
        }
        let info = data["info"] as? String
        return User(
            firstname: firstName, surname: surname,
            email: email, password: "",
            commentCount: commentCount, booksId: booksData, info: info)
    }
}
