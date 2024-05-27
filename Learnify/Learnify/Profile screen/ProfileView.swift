import UIKit
import SnapKit

// MARK: - Хасаншина Язгуль

protocol ProfileViewDelegate: AnyObject {
    func signOutImageDidPressed()
}

class ProfileView: UIView {

    lazy var firstnameLabel: UILabel = UILabel()
    lazy var surnameLabel: UILabel = UILabel()

    lazy var avatarImageView: UIImageView = UIImageView()

    let commentLabel: UILabel = UILabel()
    let bookLabel: UILabel = UILabel()

    lazy var commentCountLabel: UILabel = UILabel()
    lazy var bookCountLabel: UILabel = UILabel()

    lazy var commentIconImageView: UIImageView = UIImageView()
    lazy var bookIconImageView: UIImageView = UIImageView()

    lazy var infoTitleLabel: UILabel = UILabel()
    lazy var infoLabel: UILabel = UILabel()

    lazy var signOutImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sign-out")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(signOutImageViewTapGestureRecognizer)
        return image
    }()
    private lazy var signOutImageViewTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(signOutImageTapped))

    weak var delegate: ProfileViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFunc()
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupFunc() {
        setupAvatarImageView()
        setupNameLabel()
        setupCommentBookLabel()
        setupCommentIconImageViewl()
        setupBookIconImageView()
        setupCommentCountLabel()
        setupBookCountLabel()
        setupInfoTitleLabel()
        setupInfoLabel()
    }

    private func setupNameLabel() {
        firstnameLabel.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        firstnameLabel.textColor = .black

        firstnameLabel.text = "Yazgul"

        surnameLabel.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        surnameLabel.textColor = .black

        surnameLabel.text = "Khasanshina"

        let stackView = UIStackView(arrangedSubviews: [firstnameLabel, surnameLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5

        addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
    }
    private func setupAvatarImageView() {
        addSubview(avatarImageView)

        avatarImageView.image = UIImage(named: "no-avatar")
        avatarImageView.contentMode = .scaleToFill

        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(42)
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
    }
    private func setupCommentBookLabel() {
        commentLabel.text = "Comments"
        commentLabel.font = UIFont.systemFont(ofSize: 14)
        commentLabel.textColor = .gray

        bookLabel.text = "Books"
        bookLabel.font = UIFont.systemFont(ofSize: 14)
        bookLabel.textColor = .gray

        let stackView = UIStackView(arrangedSubviews: [commentLabel, bookLabel])
        stackView.axis = .horizontal
        stackView.spacing = 75

        addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.top.equalTo(firstnameLabel.snp.bottom).offset(80)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
    }
    private func setupCommentCountLabel() {
        commentCountLabel.font = UIFont.systemFont(ofSize: 16)
        commentCountLabel.textColor = .black

        addSubview(commentCountLabel)

        commentCountLabel.snp.makeConstraints { make in
            make.top.equalTo(commentLabel.snp.bottom).offset(5)
            make.centerX.equalTo(commentLabel.snp.centerX)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
    }
    private func setupBookCountLabel() {
        bookCountLabel.font = UIFont.systemFont(ofSize: 16)
        bookCountLabel.textColor = .black

        addSubview(bookCountLabel)

        bookCountLabel.snp.makeConstraints { make in
            make.top.equalTo(commentLabel.snp.bottom).offset(5)
            make.centerX.equalTo(bookLabel.snp.centerX)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
    }
    private func setupCommentIconImageViewl() {
        addSubview(commentIconImageView)

        commentIconImageView.image = UIImage(named: "commentIcon")
        commentIconImageView.contentMode = .scaleAspectFit

        commentIconImageView.snp.makeConstraints { make in
            make.bottom.equalTo(commentLabel.snp.top).offset(-3)
            make.centerX.equalTo(commentLabel.snp.centerX)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
    }
    private func setupBookIconImageView() {
        addSubview(bookIconImageView)

        bookIconImageView.image = UIImage(named: "bookIcon")
        bookIconImageView.contentMode = .scaleAspectFit

        bookIconImageView.snp.makeConstraints { make in
            make.bottom.equalTo(bookLabel.snp.top).offset(-3)
            make.centerX.equalTo(bookLabel.snp.centerX)
            make.height.equalTo(23)
            make.width.equalTo(23)
        }
    }
    private func setupInfoTitleLabel() {
        infoTitleLabel.text = "About"
        infoTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        infoTitleLabel.textColor = .gray
        addSubview(infoTitleLabel)

        infoTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(commentCountLabel.snp.bottom).offset(80)
            make.leading.equalTo(safeAreaLayoutGuide).offset(20)
            make.height.equalTo(20)
        }

        infoTitleLabel.accessibilityIdentifier = AccessibilityIdentifiers.infoTitleLabel
    }
    private func setupInfoLabel() {
        infoLabel.font = UIFont.systemFont(ofSize: 16)
        infoLabel.textAlignment = .left
        infoLabel.numberOfLines = 3
        infoLabel.textColor = .black
        infoLabel.text = "..."

        addSubview(infoLabel)

        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(infoTitleLabel.snp.bottom).offset(8)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-20)
            make.leading.equalTo(safeAreaLayoutGuide).offset(20)
            make.height.equalTo(42)
        }

        infoLabel.accessibilityIdentifier = AccessibilityIdentifiers.infoLabel
    }

}
extension ProfileView {
    func configureView() {
        addSubview(signOutImageView)

        signOutImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(16)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(8)
            make.size.equalTo(CGSize(width: 20, height: 20))
        }
    }
}
extension ProfileView: ProfileViewModelDataSetterDelegate {
    func dataUpdater(firstname: String, surname: String, commentCount: Int, bookCount: Int, info: String) {
        self.firstnameLabel.text = firstname
        self.surnameLabel.text = surname
        self.commentCountLabel.text = String(commentCount)
        self.bookCountLabel.text = String(bookCount)
        self.infoLabel.text = info

        self.setNeedsLayout()
    }

}
extension ProfileView {
    @objc func signOutImageTapped() {
        delegate?.signOutImageDidPressed()
    }
}
