//
//  Tweet.swift
//  TwitterReporteriOS
//
//  Created by Neal Soni on 4/30/20.
//  Copyright © 2020 Yale University. All rights reserved.
//

import Foundation

struct Tweet {
    let profileImageURL: String
    let nameOfPerson: String
    let handle: String
    let time: String
    let textOfTweet: String
    let likesCount: String
    let retweetCount: String
    let tag: String
}

extension Tweet: Decodable {
    enum TweetCodingKeys: String, CodingKey {
        case profileImageURL = "profile_image_url"
        case nameOfPerson = "author"
        case handle
        case time
        case textOfTweet = "text_of_tweet"
        case likesCount = "likes_count"
        case retweetCount = "retweet_count"
        case tag
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TweetCodingKeys.self)
        profileImageURL = try container.decode(String.self, forKey: .profileImageURL)
        nameOfPerson = try container.decode(String.self, forKey: .nameOfPerson)
        handle = try container.decode(String.self, forKey: .handle)
        time = try container.decode(String.self, forKey: .time)
        textOfTweet = try container.decode(String.self, forKey: .textOfTweet)
        likesCount = try container.decode(String.self, forKey: .likesCount)
        retweetCount = try container.decode(String.self, forKey: .retweetCount)
        tag = try container.decode(String.self, forKey: .tag)
    }
}
