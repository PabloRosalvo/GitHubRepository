//
//  DetailsGithubCollectionView.swift
//  Github
//
//  Created by Pablo Rosalvo de Melo Lopes on 09/06/20.
//  Copyright © 2020 Pablo Rosalvo de Melo Lopes. All rights reserved.
//

import Kingfisher
import UIKit

final class DetailsGithubCollectionView: UIView {
    
    private lazy var titleLabel: UILabel  = {
        let label = UILabel()
        label.text = "Lista de Repositórios"
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configureViews()
        setupViewHierarchy()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
     
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.backgroundColor = .clear
    }
    
    func setDataSource(_ dataSource: DetailsGithubDataSource) {
        self.collectionView.delegate = dataSource
        self.collectionView.dataSource = dataSource
        dataSource.collectionView = self.collectionView
    }
    
    private func setupViewHierarchy() {
        self.addSubview(titleLabel)
        self.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(48)
            make.trailing.equalTo(self.snp.trailing).offset(-10)
            make.leading.equalTo(self.snp.leading).offset(16)
        }
        
        self.collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(16)
            make.trailing.equalTo(self.snp.trailing)
            make.leading.equalTo(self.snp.leading)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
}
