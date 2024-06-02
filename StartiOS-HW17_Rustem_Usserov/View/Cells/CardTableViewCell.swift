//
//  CardTableViewCell.swift
//  StartiOS-HW17_Rustem_Usserov
//
//  Created by Rustem on 02.06.2024.
//

import Foundation
import UIKit
import SnapKit

class CardTableViewCell: UITableViewCell {

    let cardImageview = UIImageView()
    let nameLabel = UILabel()
    let typeLabel = UILabel()
    let rarityLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("No storyboard, man!")
    }

    private func setupViews() {
        addSubview(cardImageview)
        addSubview(nameLabel)
        addSubview(typeLabel)
        addSubview(rarityLabel)

        cardImageview.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(50)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(cardImageview.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }

        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.leading.equalTo(cardImageview.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }

        rarityLabel.snp.makeConstraints { make in
            make.top.equalTo(typeLabel.snp.bottom).offset(5)
            make.leading.equalTo(cardImageview.snp.trailing).offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }

    func configure(with card: Card) {
        nameLabel.text = card.name
        typeLabel.text = card.type
        rarityLabel.text = card.rarity
        if let imageUrl = card.imageUrl, let url = URL(string: imageUrl) {
            cardImageview.loadImage(from: url)
        }
    }
}

extension UIImageView {
    func loadImage(from url: URL) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
        }
    }
}
