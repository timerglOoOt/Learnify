import UIKit

// MARK: - Хайруллин Тимур
class StartViewController: UIViewController {
    private var startView = StartView(frame: .zero)
    private var coordinator: Coordinator?

    override func loadView() {
        view = startView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        startView.delegate = self
        coordinator = Coordinator(navigationController: navigationController ?? UINavigationController())
    }
}

extension StartViewController: StartViewDelegate {
    func continueButtonDidPressed() {
        // TODO: push to login controller
        coordinator?.goToHomePage()
    }
}
