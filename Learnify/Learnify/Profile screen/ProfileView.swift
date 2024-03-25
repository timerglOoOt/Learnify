import UIKit
import SnapKit

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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFunc()
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
        firstnameLabel.font = UIFont.systemFont(ofSize: 19)
        firstnameLabel.textColor = .black

        surnameLabel.font = UIFont.systemFont(ofSize: 19)
        surnameLabel.textColor = .black

        let stackView = UIStackView(arrangedSubviews: [firstnameLabel, surnameLabel])
        stackView.axis = .horizontal
        stackView.spacing = 5

        addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
    }
    private func setupAvatarImageView() {
        addSubview(avatarImageView)

        avatarImageView.image = UIImage(named: "no-avatar")
        avatarImageView.contentMode = .scaleAspectFit

        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
    }
    private func setupCommentBookLabel() {
        commentLabel.text = "Comments"
        commentLabel.font = UIFont.systemFont(ofSize: 16)
        commentLabel.textColor = .gray

        bookLabel.text = "Books"
        bookLabel.font = UIFont.systemFont(ofSize: 16)
        bookLabel.textColor = .gray

        let stackView = UIStackView(arrangedSubviews: [commentLabel, bookLabel])
        stackView.axis = .horizontal
        stackView.spacing = 75

        addSubview(stackView)

        stackView.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(100)
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
        }
    }
    private func setupCommentIconImageViewl() {
        addSubview(commentIconImageView)

        commentIconImageView.image = UIImage(named: "commentIcon")
        commentIconImageView.contentMode = .scaleAspectFit

        commentIconImageView.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(101)
            make.trailing.equalTo(commentLabel.snp.leading).offset(-8)
            make.height.equalTo(20)
            make.width.equalTo(20)
        }
    }
    private func setupBookIconImageView() {
        addSubview(bookIconImageView)

        bookIconImageView.image = UIImage(named: "bookIcon")
        bookIconImageView.contentMode = .scaleAspectFit

        bookIconImageView.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(98)
            make.trailing.equalTo(bookLabel.snp.leading).offset(-8)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
    }
    private func setupInfoTitleLabel() {
        infoTitleLabel.text = "About"
        infoTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        infoTitleLabel.textColor = .gray
//        infoTitleLabel.textColor = UIColor.hexStringToUIColor(hex: "323390")
        
        addSubview(infoTitleLabel)

        infoTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(commentLabel.snp.bottom).offset(125)
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(20)
        }
    }
    private func setupInfoLabel() {
        infoLabel.font = UIFont.systemFont(ofSize: 14)
        infoLabel.textAlignment = .left
        infoLabel.numberOfLines = 8
        infoLabel.textColor = .black

        addSubview(infoLabel)

        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(infoTitleLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-30)
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
