//
//  Tweet.swift
//  TwitterReporteriOS
//
//  Created by Neal Soni on 4/30/20.
//  Copyright © 2020 Yale University. All rights reserved.
//

import Foundation

struct Tweet {
    var profileImageURL: String!
    var nameOfPerson: String!
    var handle: String!
    var time: String!
    var textOfTweet: String!
    var likesCount: String!
    var retweetCount: String!
    var tag: String!
    
    init(profileImageURL: String, nameOfPerson: String, handle: String, time: String, textOfTweet: String, likesCount: String, retweetCount: String, tag: String) {
        self.profileImageURL = profileImageURL
        self.nameOfPerson = nameOfPerson
        self.handle = handle
        self.time = time
        self.textOfTweet = textOfTweet
        self.likesCount = likesCount
        self.retweetCount = retweetCount
        self.tag = tag
    }
}
