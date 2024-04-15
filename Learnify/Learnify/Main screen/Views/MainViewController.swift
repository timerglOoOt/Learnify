import UIKit
import Combine

// MARK: - Хайруллин Тимур

class MainViewController: UIViewController {
    private let mainView = MainView(frame: .zero)
    private let viewModel: MainViewModel
    private var cancellables = Set<AnyCancellable>()

    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.setupDataSource(with: self)
        mainView.setupDelegate(with: self)

        setupBindings()
        viewModel.getBooksByQuery(query: "Рyбин")
    }

    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Setup bindings

extension MainViewController {
    func setupBindings() {
        setupBooks()
        setupError()
    }

    func setupBooks() {
    viewModel.$books
        .receive(on: DispatchQueue.main)
        .sink { [weak self] _ in
            self?.mainView.reloadData()
        }
        .store(in: &cancellables)
    }

    func setupError() {
        viewModel.errorMessage
            .compactMap { $0 }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] message in
                let alert = UIAlertController(title: "Error", message: message.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            }
            .store(in: &cancellables)
    }
}

// MARK: Setup Table View

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.configureCell(tableView, cellForRowAt: indexPath)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.selectionStyle = .none
    }
}
