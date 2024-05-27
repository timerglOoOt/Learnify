import UIKit

// MARK: - Хайруллин Тимур
class StartViewController: UIViewController {
    private let startView = StartView(frame: .zero)
    private let viewModel: StartViewModel

    override func loadView() {
        view = startView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        startView.delegate = self
    }

    init(viewModel: StartViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StartViewController: StartViewDelegate {
    func continueButtonDidPressed() {
       //viewModel.goToLogin()
        viewModel.goToReg()
    }
}
