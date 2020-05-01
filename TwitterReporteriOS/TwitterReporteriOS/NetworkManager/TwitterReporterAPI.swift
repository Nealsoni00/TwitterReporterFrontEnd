//
//  TwitterReporterAPI.swift
//  TwitterReporteriOS
//
//  Created by Neal Soni on 4/30/20.
//  Copyright © 2020 Yale University. All rights reserved.
//

import Foundation
import Moya
// Protocol used for network manager injection into a view controller to test functionality with fake manager and data.
protocol Networkable {
//    var networkProvider: NetworkManager! { get set }
}

enum TwitterReporterAPI {
    case getTweets
}


// MARK: - TwitterReporterAPI TargetType Protocol Implementation
extension TwitterReporterAPI: TargetType {
    var enviormentBaseURL : String {
        switch NetworkManager.environment {
        case .Production: return "https://api.TwitterReporter.herokuapp.com/"
        case .Staging: return "https://staging.TwitterReporter.herokuapp.com/"
        case .Dev: return "https://dev.TwitterReporter.herokuapp.com/"
        }
    }
    
    var baseURL: URL {
        guard URL(string: enviormentBaseURL) != nil else { fatalError("base URL could not be determined")}
    }
    
    var path: String {
        switch self {
        case .getTweets:
            return "/tweets"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getTweets:
            return .get
        }
    }
        
    var sampleData: Data {
        switch self {
        case .getTweets:
            return getFakeData()
        }
    }
    
    var task: Task {
        switch self {
        case .getTweets:
            return .requestPlain
        default:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
