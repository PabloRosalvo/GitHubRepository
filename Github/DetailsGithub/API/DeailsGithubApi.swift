//
//  DeailsGithubApi.swift
//  Github
//
//  Created by Pablo Rosalvo de Melo Lopes on 08/06/20.
//  Copyright © 2020 Pablo Rosalvo de Melo Lopes. All rights reserved.
//

import Foundation

protocol GithubDetailApiProtocol {
    func fetch(completion: @escaping (Int?, _ details: GitHubDetail?) -> Swift.Void)
}

class DeailsGithubApi: GithubDetailApiProtocol {
    
    enum BaseUrl {
        static let urlStars = "https://api.github.com/search/repositories?q=language:swift&sort=stars"
    }
    
    private let connectionManager: ConnectionManager
    
    init(connectionManager: ConnectionManager = ConnectionManager()) {
        self.connectionManager = connectionManager
    }
    
    func fetch(completion: @escaping (Int?, _ details: GitHubDetail?) -> Swift.Void)  {
        connectionManager.request(url:  BaseUrl.urlStars, method: .get, parameters: nil, headers: nil) { (statusCode, details: GitHubDetail?) in
            completion(statusCode, details)
        }
    }

}
