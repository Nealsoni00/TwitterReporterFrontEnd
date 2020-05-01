//
//  TweetsVC.swift
//  TwitterReporteriOS
//
//  Created by Neal Soni on 4/30/20.
//  Copyright © 2020 Yale University. All rights reserved.
//

import UIKit

class TweetsVC: UITableViewController {
    @IBOutlet var activitySpinner: UIActivityIndicatorView!
    
    let refresher = UIRefreshControl()
    var noTweetsView: UIView?

    var networkProvider: Networkable!
    init(networkProvider: Networkable) {
        super.init(nibName: nil, bundle: nil)
        self.networkProvider = networkProvider
    }
    
    required init?(coder: NSCoder) {
        super.init(nibName: nil, bundle: nil)
        let provider = NetworkManager()
        self.networkProvider = provider
    }
    
    var tweets = [Tweet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load fake data
        networkProvider.getTweets() { tweets in
            self.tweets = tweets
            print(tweets)
            self.tableView.reloadData()
        }
//        self.tableView.register(TweetCell.self,  forCellReuseIdentifier: "tweetCell123")
        // Add a pull-down refresher to the table to refresh announcements from backend
        refresher.addTarget(self, action: #selector(shouldRefreshTweets), for: .valueChanged)
        if #available(iOS 10.0, *) {
           tableView.refreshControl = refresher
        } else {
           tableView.addSubview(refresher)
        }
        initEmptyView()


    }
    
    // Function triggered on refreshControl (when the user pulls down on the table view)
    @objc func shouldRefreshTweets(_ sender: Any) {
        networkProvider.getTweets() { tweets in
            self.tweets = tweets
            print(tweets)
            self.tableView.reloadData()
            if self.refresher.isRefreshing {
                self.refresher.endRefreshing()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        noTweetsView?.isHidden = (allNotifications.count > 0)
        return tweets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("HERE!!!!")
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TweetCell

        cell.initialize(tweet: tweets[indexPath.row])

        return cell
    }
    // Automatic row heights when there is extra data
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func initEmptyView() {
        noTweetsView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        noTweetsView?.backgroundColor = UIColor.white
        
        let noActiveEmergenciesLabel = UILabel(frame: CGRect(x: 0, y: self.view.center.y - 100, width: self.view.frame.width, height: 100))
        noActiveEmergenciesLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        noActiveEmergenciesLabel.numberOfLines = 1
        noActiveEmergenciesLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        noActiveEmergenciesLabel.shadowColor = UIColor.lightText
        noActiveEmergenciesLabel.textColor = UIColor.darkGray
        noActiveEmergenciesLabel.shadowOffset = CGSize(width: 0, height: 1)
        noActiveEmergenciesLabel.backgroundColor = UIColor.clear
        noActiveEmergenciesLabel.textAlignment = NSTextAlignment.center
        noActiveEmergenciesLabel.text = "No Notifications"
        noTweetsView?.addSubview(noActiveEmergenciesLabel)
        
        noTweetsView?.isHidden = true
        
        self.tableView.insertSubview(noTweetsView!, belowSubview: self.tableView)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
