//
//  GitHubDetail.swift
//  Github
//
//  Created by Pablo Rosalvo de Melo Lopes on 08/06/20.
//  Copyright © 2020 Pablo Rosalvo de Melo Lopes. All rights reserved.
//

import Foundation

struct GitHubDetail: Codable {
    let items: [Item]?
}

struct Item: Codable {
    let name: String?
    let fullName: String?
    let owner: Owner?
    let stargazersCount: Int?
    
    private enum CodingKeys: String, CodingKey {
           case name = "name"
           case fullName =  "full_name"
           case owner = "owner"
           case stargazersCount = "stargazers_count"
       }
}

struct Owner: Codable {
    let avatarUrl: String?
    
    private enum CodingKeys: String, CodingKey {
        case avatarUrl = "avatar_url"
    }
    
}
