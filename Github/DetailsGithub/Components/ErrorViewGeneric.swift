//
//  ErrorViewGeneric.swift
//  Github
//
//  Created by Pablo Rosalvo de Melo Lopes on 09/06/20.
//  Copyright © 2020 Pablo Rosalvo de Melo Lopes. All rights reserved.
//


import UIKit

public class ErrorViewGeneric: UIView {
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var actionButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tente Novamente", for: .normal)
        button.isHidden = true
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    var reloadAction: (() -> Void)? = nil {
        didSet {
            actionButton.isHidden = false
        }
    }
        
    public init() {
        super.init(frame: .zero)
        setupViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func buttonAction() {
        reloadAction?()
        removeFromSuperview()
    }
}

// MARK: Configuration

extension ErrorViewGeneric {
    func setupViewHierarchy() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(actionButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     imageView.topAnchor.constraint(equalTo: topAnchor),
                                     imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
                                     imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 0.5)])
        
        NSLayoutConstraint.activate([titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                                     titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
                                     titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)])
        
        NSLayoutConstraint.activate([subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                                     subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
                                     subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)])
        
        NSLayoutConstraint.activate([actionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                                     actionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                                     actionButton.heightAnchor.constraint(equalToConstant: 48),
                                     actionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32)])
    }
    
    func configureViews() {
        imageView.image = #imageLiteral(resourceName: "imageError")
        titleLabel.text = "Ops, ocorreu um erro"
        subtitleLabel.text = "Tente novamente"
        self.backgroundColor = .white
    }
}
