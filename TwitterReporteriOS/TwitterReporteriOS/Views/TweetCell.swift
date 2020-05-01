//
//  TweetCell.swift
//  TwitterReporteriOS
//
//  Created by Neal Soni on 4/24/20.
//  Copyright © 2020 Yale University. All rights reserved.
//

import UIKit
import Kingfisher

class TweetCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameOfPerson: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var textOfTweetLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var retweetsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Method called when the cell is selected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initialize(tweet: Tweet) {
        self.profileImage.kf.indicatorType = .activity
        self.profileImage.kf.setImage(with: URL(string: tweet.profileImageURL), placeholder: nil, options: nil, progressBlock: nil) { result in
            print("successfully set image using king fisher hashing")
        }
    }
}
