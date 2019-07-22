//
//  ViewController.swift
//  Twittermenti
//
//  Created by Quynh Nguyen on 7/17/19.
//  Copyright © 2019 Quynh Nguyen. All rights reserved.
//

import UIKit
import SwifteriOS
import CoreML
import SwiftyJSON

class ViewController: UIViewController {
    @IBOutlet weak var sentimentLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    let swifter = Swifter(consumerKey: "", consumerSecret: "")
    let sentimentClassifer = TweetSentimentClassifer()
    let language = "en"
    let tweetCount = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func predictPressed(_ sender: Any) {
        fetchTweets()
    }
    
    private func fetchTweets() {
        if let text = textField.text {
            swifter.searchTweet(using: text, lang: language, count: tweetCount, tweetMode: .extended, success: { (results, metadata) in
                var tweets = [TweetSentimentClassiferInput]()
                
                for i in 0..<self.tweetCount {
                    if let tweet = results[i]["full_text"].string {
                        let tweetClassification = TweetSentimentClassiferInput(text: tweet)
                        tweets.append(tweetClassification)
                    }
                }
                
                self.makePrediction(with: tweets)
            }) { (error) in
                print("Error with twitter api request: \(error)")
            }
        }
    }
    
    private func makePrediction(with tweets: [TweetSentimentClassiferInput]) {
        do {
            let predictions = try sentimentClassifer.predictions(inputs: tweets)
            var sentimentScore = 0
            
            for pred in predictions {
                let sentiment = pred.label
                
                if sentiment == "Pos" {
                    sentimentScore += 1
                } else if sentiment == "Neg" {
                    sentimentScore -= 1
                }
            }
            displaySentiment(with: sentimentScore)
        } catch {
            print("Error with making prediction: \(error)")
        }
    }
    
    private func displaySentiment(with sentimentScore: Int) {
        if sentimentScore > 20 {
            sentimentLabel.text = "😍"
        } else if sentimentScore > 10 {
            sentimentLabel.text = "😄"
        } else if sentimentScore > 0 {
            sentimentLabel.text = "🙂"
        } else if sentimentScore == 0 {
            sentimentLabel.text = "😐"
        } else if sentimentScore > -10 {
            sentimentLabel.text = "🙁"
        } else if sentimentScore > -20 {
            sentimentLabel.text = "😡"
        } else {
            sentimentLabel.text = "🤮"
        }
    }
}

