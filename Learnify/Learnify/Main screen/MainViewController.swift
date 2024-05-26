import UIKit
import SwiftUI
import Combine

// MARK: - Хайруллин Тимур пример реализации на UIKit

class MainViewController: UIViewController {
    private let viewModel: MainViewModel
    private var cancellables = Set<AnyCancellable>()
    private var hostingController: UIHostingController<SwiftUIMainView>?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureSwiftUIView()
    }

    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MainViewController {
    func configureSwiftUIView() {
        let swiftUIView = SwiftUIMainView()
        hostingController = UIHostingController(rootView: swiftUIView)
        if let hostingController = hostingController {
            addChild(hostingController)
            hostingController.view.frame = view.bounds
            hostingController.view.backgroundColor = .white
            view.addSubview(hostingController.view)
            hostingController.didMove(toParent: self)
        }
    }
}

// MARK: - Хайруллин Тимур пример реализации на UIKit

// class MainViewController: UIViewController {
//    private let mainView = MainView(frame: .zero)
//    private let viewModel: MainViewModel
//    private var cancellables = Set<AnyCancellable>()
//
//    override func loadView() {
//        view = mainView
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        mainView.setupDataSource(with: self)
//        mainView.setupDelegate(with: self)
//
//        setupBindings()
//        viewModel.getBooksByQuery(query: "Рyбин")
//    }
//
//    init(viewModel: MainViewModel) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
// }
//
// // MARK: Setup bindings
//
// extension MainViewController {
//    func setupBindings() {
//        setupBooks()
//        setupError()
//    }
//
//    func setupBooks() {
//    viewModel.$books
//        .receive(on: DispatchQueue.main)
//        .sink { [weak self] _ in
//            self?.mainView.reloadData()
//        }
//        .store(in: &cancellables)
//    }
//
//    func setupError() {
//        viewModel.errorMessage
//            .compactMap { $0 }
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] message in
//                self?.showCustomAlert(
//                    title: "Error",
//                    message: "Error searching for books based on the entered text \(message.localizedDescription)"
//                )
//            }
//            .store(in: &cancellables)
//    }
// }
//
// // MARK: Setup Table View
//
// extension MainViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        viewModel.numberOfRowsInSection()
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        viewModel.configureCell(tableView, cellForRowAt: indexPath)
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.cellForRow(at: indexPath)?.selectionStyle = .none
//    }
// }
