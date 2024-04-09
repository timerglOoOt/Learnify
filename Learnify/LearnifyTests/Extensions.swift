//
//  Extensions.swift
//  LearnifyTests
//
//  Created by Faki Doosuur Doris on 08.04.2024.
//

import Foundation

@testable import struct Learnify.User

extension User: Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        lhs.email == rhs.email
    }
}
