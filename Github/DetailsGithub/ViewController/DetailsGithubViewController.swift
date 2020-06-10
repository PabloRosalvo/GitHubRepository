//
//  DetailsGithubViewController.swift
//  Github
//
//  Created by Pablo Rosalvo de Melo Lopes on 08/06/20.
//  Copyright © 2020 Pablo Rosalvo de Melo Lopes. All rights reserved.
//

import UIKit

final class DetailsGithubViewController: UIViewController {
    
    let viewModel: DetailsGithubViewModel
    let navigation: UINavigationController
    var refreshControl = UIRefreshControl()
    
    let contentView: DetailsGithubCollectionView = {
        let view = DetailsGithubCollectionView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var dataSource: DetailsGithubDataSource = {
        let source = DetailsGithubDataSource()
        return source
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchDetails()
        refreshToControl()
        self.view.backgroundColor = .white
    }
    
    override func loadView() {
        self.view = contentView
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let background = CAGradientLayer().getGradient(viewToApply: view)
        background.frame = self.view.bounds
        view.layer.insertSublayer(background, at: 0)
    }

    func refreshToControl() {
        refreshControl.tintColor = UIColor.white
        refreshControl.addTarget(self, action: #selector(self.refreshData), for: .valueChanged)
        contentView.collectionView.addSubview(refreshControl)
        contentView.collectionView.alwaysBounceVertical = true
    }
    
    @objc func refreshData() {
        fetchDetails()
    }
    
    init(viewModel: DetailsGithubViewModel, navigation: UINavigationController) {
        self.navigation = navigation
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fetchDetails() {
        self.viewModel.fetchDetails { success in
            self.refreshControl.endRefreshing()
            if success {
                self.dataSource.setViewModel(viewModel: self.viewModel)
                self.contentView.setDataSource(self.dataSource)
            } else {
                self.handleError()
            }
        }
    }
    
    func handleError() {
        self.ds.showError {
            self.fetchDetails()
        }
    }
    
}

