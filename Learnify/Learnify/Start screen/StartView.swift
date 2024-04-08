import UIKit
import SnapKit

// MARK: - Хайруллин Тимур
protocol StartViewDelegate: AnyObject {
    func continueButtonDidPressed()
}

class StartView: UIView {
    private lazy var startImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Logo"))
        image.contentMode = .scaleToFill
        return image
    }()

    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Learnify"
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .black
        label.textAlignment = .justified
        return label
    }()

    private lazy var startLabel: UILabel = {
        let label = UILabel()
        label.text = "Let's get started!"
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = UIColor.hexStringToUIColor(hex: "3B4651")
        label.textAlignment = .justified
        label.accessibilityIdentifier = "Start Label"
        return label
    }()

    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = UIColor.hexStringToUIColor(hex: "323390")
        button.setTitleColor(.gray, for: .highlighted)
        let action = UIAction { [weak self] _ in
            self?.delegate?.continueButtonDidPressed()
        }
        button.addAction(action, for: .touchUpInside)
        button.accessibilityIdentifier = "Start button"
        return button
    }()

    weak var delegate: StartViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StartView {

    private func setupViews() {
        backgroundColor = .white

        let labelStack = UIStackView(arrangedSubviews: [welcomeLabel, startLabel])
        labelStack.axis = .vertical
        labelStack.spacing = 5

        addSubview(startImageView)
        addSubview(labelStack)
        addSubview(continueButton)

        startImageView.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(30)
            make.top.equalToSuperview().inset(150)
            make.height.equalTo(300)
        }

        labelStack.snp.makeConstraints { make in
            make.top.equalTo(startImageView.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(30)
        }

        continueButton.snp.makeConstraints { make in
            make.bottom.trailing.equalToSuperview().inset(40)
            make.size.equalTo(CGSize(width: 120, height: 50))
        }
    }
}
