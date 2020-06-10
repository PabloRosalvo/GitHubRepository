//
//  GithubDetailApiMock.swift
//  GithubTests
//
//  Created by Pablo Rosalvo de Melo Lopes on 10/06/20.
//  Copyright © 2020 Pablo Rosalvo de Melo Lopes. All rights reserved.
//

@testable import Github

final class GithubDetailApiMock: GithubDetailApiProtocol {
    
    var shouldReturn: Bool = false

    init(shouldReturn: Bool) {
        self.shouldReturn = shouldReturn
    }

    func fetch(completion: @escaping (Int?, GitHubDetail?) -> Void) {
        if shouldReturn {
            let model: GitHubDetail = JSONHelper.getObjectFrom(json: "DetailsGithubMock", type: GitHubDetail.self)!
            completion(200, model)
        } else {
            completion(500, nil)
        }
    }

}
