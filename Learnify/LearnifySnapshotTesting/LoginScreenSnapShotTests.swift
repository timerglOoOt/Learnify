//
//  LoginScreenSnapShotTests.swift
//  LearnifyTests
//
//  Created by Faki Doosuur Doris on 08.04.2024.
//

import XCTest
import SnapshotTesting

@testable import Learnify

final class LoginScreenSnapShotTests: XCTestCase {

    override func setUpWithError() throws {
    }

    func testExample() throws {
        let viewModel = LoginModel()
        let loginViewController = LoginViewController(viewModel: viewModel)
        assertSnapshot(of: loginViewController, as: .image)
    }

    func test_login_screen_on_iPad() throws {
        let viewModel = LoginModel()
        let loginViewController = LoginViewController(viewModel: viewModel)
        assertSnapshot(of: loginViewController, as: .image(on: .iPadPro11(.portrait)))
    }

}
