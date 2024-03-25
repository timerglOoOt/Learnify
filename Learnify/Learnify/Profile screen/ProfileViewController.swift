import UIKit

// MARK: - Хасаншина Язгуль

protocol ProfileViewModelDataSetterDelegate: AnyObject {
    func dataUpdater(firstname: String, surname: String, commentCount: Int, bookCount: Int, info: String)
}

class ProfileViewController: UIViewController {

    private let contentView: ProfileView = .init()
    private let viewModel: ProfileViewModel

    weak var delegate: ProfileViewModelDataSetterDelegate?

    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        delegate = contentView
        userData()
    }

    func userData() {
        viewModel.obtainCurrentUser { user in
            self.delegate?.dataUpdater(firstname: user.firstname,
                                       surname: user.surname,
                                       commentCount: user.commentCount,
                                       bookCount: user.bookCount,
                                       info: user.info ?? "Write something...")
        }
    }
}
