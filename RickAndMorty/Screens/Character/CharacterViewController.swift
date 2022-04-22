import Foundation
import UIKit
import Kingfisher

final class CharacterViewController: UIViewController {

    struct Model {
        let statusModel: InfoCell.Model
        let name: String
        let imageURL: URL
    }

    init(model: Model) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "Character"

        setupUI()
        updateInfo()
    }

    private func setupUI() {
        view.addSubview(icon)
        view.addSubview(nameLabel)
        view.addSubview(infoCell)

        view.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            icon.widthAnchor.constraint(equalToConstant: 300),
            icon.heightAnchor.constraint(equalToConstant: 300),
            icon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            icon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: icon.bottomAnchor, constant: 35),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            infoCell.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            infoCell.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            infoCell.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }

    private func updateInfo() {
        icon.kf.setImage(with: model.imageURL)
        nameLabel.text = model.name
        infoCell.update(with: model.statusModel)
    }

    private let model: Model

    private lazy var icon: UIImageView = {
        let ret = UIImageView()
        ret.layer.cornerRadius = 10
        ret.layer.masksToBounds = true
        ret.contentMode = .scaleAspectFill
        return ret
    }()

    private lazy var nameLabel: UILabel = {
        let ret = UILabel()
        ret.font = .boldSystemFont(ofSize: 34)
        ret.numberOfLines = 1
        ret.textColor = .main
        return ret
    }()

    private lazy var infoCell = InfoCell()
}
