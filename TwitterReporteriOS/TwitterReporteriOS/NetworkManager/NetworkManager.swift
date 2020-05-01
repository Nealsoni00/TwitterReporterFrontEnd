//
//  NetworkManager.swift
//  TwitterReporteriOS
//
//  Created by Neal Soni on 4/30/20.
//  Copyright © 2020 Yale University. All rights reserved.
//

import Foundation
enum Environment {
    case Dev
    case Staging
    case Production
}
class NetworkManager: NSObject {
    static let environment: Environment = .Production
}
