//
//  GithubDetailsCell.swift
//  Github
//
//  Created by Pablo Rosalvo de Melo Lopes on 08/06/20.
//  Copyright © 2020 Pablo Rosalvo de Melo Lopes. All rights reserved.
//

import Kingfisher
import SnapKit
import UIKit

final class GithubDetailsCell: UICollectionViewCell {
    
    private let nameRepository: UILabel  = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let amountStars: UILabel  = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let gitHubImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "Captura de Tela 2020-06-09 às 20.15.48")
        iv.alpha = 0.05
        iv.layer.cornerRadius = 5
        return iv
    }()
    
    private let photoAuthorImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.configureViews()
        self.setupViewHierarchy()
        self.setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.white.cgColor
    }
    
    func setup(nameRepository: String, imageUrl: String, amountStars: Int) {
        self.nameRepository.text = "Nome Repositório: \(nameRepository)"
        self.amountStars.text = "Quantidade de estrelas: \(amountStars)"
        self.photoAuthorImageView.kf.setImage(with: URL(string: imageUrl))
    }
    
    private func setupViewHierarchy() {
        self.contentView.addSubview(gitHubImageView)
        self.contentView.addSubview(nameRepository)
        self.contentView.addSubview(amountStars)
        self.contentView.addSubview(photoAuthorImageView)
    }
    
    private func setupConstraints() {
        self.gitHubImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.trailing.equalTo(contentView.snp.trailing)
            make.leading.equalTo(contentView.snp.leading)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        self.nameRepository.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(24)
            make.trailing.equalTo(self.snp.trailing)
            make.leading.equalTo(self.snp.leading).offset(24)
        }
        self.amountStars.snp.makeConstraints { make in
            make.top.equalTo(nameRepository.snp.bottom).offset(24)
            make.trailing.equalTo(self.snp.trailing).offset(-24)
            make.leading.equalTo(self.snp.leading).offset(24)
        }
        self.photoAuthorImageView.snp.makeConstraints { make in
            make.top.equalTo(amountStars.snp.bottom).offset(20)
            make.centerX.equalTo(snp.centerX)
            make.height.equalTo(158)
            make.width.equalTo(128)
        }
    }
    
}
