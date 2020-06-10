//
//  DetailsGithubDataSource.swift
//  Github
//
//  Created by Pablo Rosalvo de Melo Lopes on 08/06/20.
//  Copyright © 2020 Pablo Rosalvo de Melo Lopes. All rights reserved.
//

import Foundation
import UIKit

protocol DetailsGithubDataProtocol {
    func getNameRepository(_ indexPath: IndexPath) -> String
    func getImageUser(_ indexPath: IndexPath) -> String
    func getAmountStars(_ indexPath: IndexPath) -> Int
}

final class DetailsGithubDataSource: NSObject, DetailsGithubDataProtocol {
        
    private var viewModel: DetailsGithubViewModel? {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    func getNameRepository(_ indexPath: IndexPath) -> String {
        return viewModel?.modelDetails?.items?[indexPath.row].fullName ?? ""
    }
    
    func getImageUser(_ indexPath: IndexPath) -> String {
       return viewModel?.modelDetails?.items?[indexPath.row].owner?.avatarUrl ?? ""
    }
    
    func getAmountStars(_ indexPath: IndexPath) -> Int {
        return viewModel?.modelDetails?.items?[indexPath.row].stargazersCount ?? 0
    }
        
    override init() {}
    
    func setViewModel(viewModel: DetailsGithubViewModel) {
        self.viewModel = viewModel
    }
    
    var collectionView: UICollectionView? {
        didSet {
            collectionView?.register(GithubDetailsCell.self, forCellWithReuseIdentifier: "DetailsGithubIdentifier")
        }
    }
    
}

extension DetailsGithubDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 300)
    }
}

extension DetailsGithubDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.modelDetails?.items?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsGithubIdentifier", for: indexPath) as! GithubDetailsCell
        cell.setup(nameRepository: getNameRepository(indexPath), imageUrl: getImageUser(indexPath), amountStars: getAmountStars(indexPath))
        return cell
    }
}
