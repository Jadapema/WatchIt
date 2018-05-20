//
//  PreviewViewController.swift
//  WatchIt
//
//  Created by Celina Martinez on 1/2/18.
//  Copyright © 2018 Jadapema. All rights reserved.
//

import UIKit
import youtube_ios_player_helper

class PreviewViewController: UIViewController, YTPlayerViewDelegate {
    

    @IBOutlet weak var youtubePlayer: YTPlayerView!
    
    @IBOutlet weak var bgTitle: UIView!
    @IBOutlet weak var movieDuration: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var yearMovie: UILabel!
    @IBOutlet weak var descriptionMovie: UILabel!
    @IBOutlet weak var titleMovie: UILabel!
    
    var backGroundColor : UIColor!
    var selectedMovie : Movie!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rating.text = selectedMovie.ratingMpa
        yearMovie.text = "\(selectedMovie.year!)"
        descriptionMovie.text = selectedMovie.synopsis
        titleMovie.text = selectedMovie.title
        
        let playerVar = [
            "playsinline" : 1,
            "autoplay" : 1,
            "rel" : 0,
            "controls" : 0,
            "showinfo" : 0,
            "fs" : 0,
            "modestbranding" : 1,
            "origin" : "http://youtube.com"
            ] as [String : Any]
        self.youtubePlayer.delegate = self
        self.youtubePlayer.load(withVideoId: "\(selectedMovie.trailerCode!)" , playerVars: playerVar)
        print("\(selectedMovie.trailerCode!)")
        youtubePlayer.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        let maskLayer = CAGradientLayer()
        maskLayer.frame = bgTitle.bounds
        maskLayer.shadowRadius = 5
        maskLayer.shadowPath = CGPath(roundedRect: bgTitle.bounds.insetBy(dx: 5, dy: 5), cornerWidth: 5, cornerHeight: 5, transform: nil)
        maskLayer.shadowOpacity = 1
        maskLayer.shadowOffset = CGSize.zero
        maskLayer.shadowColor = #colorLiteral(red: 0.1036974415, green: 0.1036974415, blue: 0.1036974415, alpha: 1)
        bgTitle.layer.mask = maskLayer
        
    }

    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }


}
