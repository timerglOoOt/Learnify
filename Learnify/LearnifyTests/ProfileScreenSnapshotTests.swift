import XCTest
import SnapshotTesting
@testable import Learnify

// MARK: - Хасаншина Язгуль

final class ProfileScreenSnapshotTests: XCTestCase {

    override func setUpWithError() throws {
//        isRecording = true
    }

    func test_profile_screen() throws {
        let viewModel = ProfileViewModel()
        let profileVC = ProfileViewController(viewModel: viewModel)

        assertSnapshot(of: profileVC, as: .image)
    }

    func test_profile_screen_on_ipad() throws {
        let viewModel = ProfileViewModel()
        let profileVC = ProfileViewController(viewModel: viewModel)

        assertSnapshot(of: profileVC, as: .image(on: .iPadPro12_9(.landscape)))
    }

}
