import UIKit

// MARK: - Хайруллин Тимур
class StartViewController: UIViewController {
    private var startView = StartView(frame: .zero)

    override func loadView() {
        view = startView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        startView.delegate = self
    }
}

extension StartViewController: StartViewDelegate {
    func continueButtonDidPressed() {
        // TODO: push to login controller
    }
}
