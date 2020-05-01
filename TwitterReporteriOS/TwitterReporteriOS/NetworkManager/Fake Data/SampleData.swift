//
//  File.swift
//  TwitterReporteriOS
//
//  Created by Neal Soni on 4/30/20.
//  Copyright © 2020 Yale University. All rights reserved.
//

import Foundation

func getFakeData() {
    return stubbedResponse("fakeData")
}

// MARK: - Provider support

func stubbedResponse(_ filename: String) -> Data! {
    @objc class TestClass: NSObject { }

    let bundle = Bundle(for: TestClass.self)
    let path = bundle.path(forResource: filename, ofType: "json")
    return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
}
