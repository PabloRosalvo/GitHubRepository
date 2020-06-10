//
//  DetailsGithubViewModel.swift
//  Github
//
//  Created by Pablo Rosalvo de Melo Lopes on 08/06/20.
//  Copyright © 2020 Pablo Rosalvo de Melo Lopes. All rights reserved.
//

import Foundation

final class DetailsGithubViewModel {
    
    private let api: GithubDetailApiProtocol
    private var model: GitHubDetail?
    
    init(api: GithubDetailApiProtocol = DeailsGithubApi()) {
        self.api = api
    }
    
    var modelDetails: GitHubDetail?  {
        return model
    }
    
    func fetchDetails(_ completion: @escaping (Bool) -> Void) {
        api.fetch { statusCode, model in
            guard let statusCode = statusCode else { return }
            if ConnectionErrorManager.isSuccessfulStatusCode(statusCode: statusCode) {
                guard let model = model else { return }
                self.model = model
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
}
