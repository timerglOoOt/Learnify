//
//  Extensions.swift
//  LearnifyTests
//
//  Created by Faki Doosuur Doris on 08.04.2024.
//
import Foundation
import Combine

@testable import struct Learnify.User
@testable import struct Learnify.Book
@testable import class Learnify.BookBuilder
@testable import enum Learnify.NetworkError
@testable import protocol Learnify.NetworkServiceProtocol

extension User: Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        lhs.email == rhs.email
    }
}

// MARK: - Тимур Хайруллин

class MockNetworkService: NetworkServiceProtocol {
    let mockURL = "http://www.googleapis.com/books/v1/volumes/mockbooks"
    let mockBooks: AnyPublisher<[Book], Error> = Just([
        BookBuilder()
            .addTitle(title: "1 part")
            .addAuthors(authors: ["Auth 1"])
            .build(),
        BookBuilder()
            .addTitle(title: "2 part")
            .addAuthors(authors: ["Auth 2"])
            .build(),
        BookBuilder()
            .addTitle(title: "3 part")
            .addAuthors(authors: ["Auth 3"])
            .build()
    ])
    .setFailureType(to: Error.self)
    .eraseToAnyPublisher()

    func searchBooks(query: String) -> AnyPublisher<[Book], Error> {
        if mockURL.elementsEqual(query) {
            return mockBooks
        } else {
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
    }
}
