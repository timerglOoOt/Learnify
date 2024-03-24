import UIKit
import SnapKit

// MARK: - Хайруллин Тимур
class MainView: UIView {
    private lazy var booksTableView: UITableView = {
        let table = UITableView()
        table.rowHeight = 100
        table.showsVerticalScrollIndicator = false
        table.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseIdentifier)
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {
    private func setupSubviews() {
        backgroundColor = .white
        addSubview(booksTableView)

        booksTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        }
    }

    func setupDataSource(with dataSource: UITableViewDataSource) {
        self.booksTableView.dataSource = dataSource
    }

    func setupDelegate(with delegate: UITableViewDelegate) {
        self.booksTableView.delegate = delegate
    }
}
