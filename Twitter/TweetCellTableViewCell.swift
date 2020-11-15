//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Renu Bandaru on 11/6/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var faveButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    var favorited:Bool = false
    var tweetID:Int = -1
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func favoriteTweet(_ sender: Any) {
        
        let toBeFavorited = !favorited
        
        if (toBeFavorited)
        {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetID, success: {
                self.setFavorite(true)
            }, failure: { (error) in
                print("Favorite did not succeed: \(error)")
            })
        }
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetID, success: {
                self.setFavorite(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed: \(error)")
            })
        }
    }
    
    
    @IBAction func reTweet(_ sender: Any) {
        
        TwitterAPICaller.client?.retweet(tweetId: tweetID, success: {
            self.setRetweeted(true)
        }, failure: { (error) in
            print("Error in retweeting : \(error)")
        })
        
    }
    
    func setRetweeted(_ isRetweeted: Bool)
    {
        if(isRetweeted)
        {
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else
        {
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
        
    }
    
    func setFavorite(_ isFavorite:Bool) {
         favorited = isFavorite
        if (favorited) {
            faveButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else
        {
            faveButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
