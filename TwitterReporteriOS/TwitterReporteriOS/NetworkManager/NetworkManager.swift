//
//  NetworkManager.swift
//  TwitterReporteriOS
//
//  Created by Neal Soni on 4/30/20.
//  Copyright © 2020 Yale University. All rights reserved.
//

import Foundation
import Moya

enum Environment {
    case Dev
    case Staging
    case Production
}

protocol Networkable {
    var provider: MoyaProvider<TwitterReporterAPI> { get }
    func getTweets(completion: @escaping ([Tweet])->())
//    var networkProvider: NetworkManager! { get set }
}


class NetworkManager: Networkable {
    static let environment: Environment = .Production
    static let TwitterReporterAPIKey = "APIKEY"
    var provider = MoyaProvider<TwitterReporterAPI>(plugins: [NetworkLoggerPlugin()])
    
    func getTweets(completion: @escaping ([Tweet])->()) {
        provider.request(.getTweets) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode([Tweet].self, from: response.data)
                    completion(results)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
