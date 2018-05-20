 //
//  MovieDetailViewController.swift
//  WatchIt
//
//  Created by Jacob Peralta on 23/9/17.
//  Copyright © 2017 Jadapema. All rights reserved.
//

import UIKit
import Apollo

class MovieDetailViewController: UIViewController {
    
    
    @IBOutlet weak var separator: UILabel!
    @IBOutlet weak var playView: UIView!
    @IBOutlet weak var movie6: UIImageView!
    @IBOutlet weak var movie5: UIImageView!
    @IBOutlet weak var movie4: UIImageView!
    @IBOutlet weak var movie3: UIImageView!
    @IBOutlet weak var movie2: UIImageView!
    @IBOutlet weak var movie1: UIImageView!
    @IBOutlet weak var genres: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var movieDuration: UILabel!
    @IBOutlet weak var ratingMpa: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var coberIV: UIImageView!
    @IBOutlet weak var BGIV: UIImageView!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet var Name: UILabel!
    @IBOutlet weak var exitView: UIView!
    @IBOutlet weak var exitImageView: UIImageView!
    var SelectedMovie : Movie!
    var background : UIColor!
    
   let apollo = ApolloClient(url: URL(string: "http://54.201.26.159:4000/graphql")!)
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.clear
        refreshControl.addTarget(self, action: #selector(pullToRefresh(_:)), for: .valueChanged)
        scroll.addSubview(refreshControl)
        
        exitView.layer.masksToBounds = false
        exitView.layer.cornerRadius = exitView.frame.height/2
        exitView.clipsToBounds = true
        
        playView.layer.masksToBounds = false
        playView.layer.cornerRadius = 2
        playView.clipsToBounds = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ExitHandle))
        exitImageView.isUserInteractionEnabled = true
        exitImageView.addGestureRecognizer(tapGestureRecognizer)
        
        BGIV.loadImageUsingCacheWithUrlString(SelectedMovie.large_cover_image)
        coberIV.loadImageUsingCacheWithUrlString(SelectedMovie.large_cover_image)
        year.text = "\(SelectedMovie.year!)"
        ratingMpa.text = "\(SelectedMovie.ratingMpa!)"
        
        Description.text = "\(SelectedMovie.synopsis!)"
        rating.text = "Rating: \(SelectedMovie.rating!)"
        
        let hour = "\(Int(SelectedMovie.runtime/60))h"
        let m = Int((Double(SelectedMovie.runtime/60).rounded(toPlaces: 2) - Double(Int(SelectedMovie.runtime/60))) * 100)
        let min = "\(m)m"
        movieDuration.text = "\(hour) \(min)"
        
        var genresrt : String {
            var str = "Genres: "
            for g in SelectedMovie.genres {
                if g == SelectedMovie.genres[SelectedMovie.genres.count - 1] {
                    str += "\(g)."
                } else {
                    str += "\(g), "
                }
            }
            return str
        }
        
        genres.text = genresrt
        
        DispatchQueue.main.async(execute: {
            let _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        })
        
        let randomGenre = SelectedMovie.genres[randomNumber(range: 0...SelectedMovie.genres.count)]
        let randomOffset = randomNumber(range: 1...110)
        self.Fetch(Limit: 6, Genre: randomGenre, offSet: randomOffset) { (randomMovies) in
            print("movies : \(randomMovies.count), genre: \(randomGenre), offset: \(randomOffset)")
            self.movie1.loadImageUsingCacheWithUrlString(randomMovies[0].large_cover_image)
            self.movie2.loadImageUsingCacheWithUrlString(randomMovies[1].large_cover_image)
            self.movie3.loadImageUsingCacheWithUrlString(randomMovies[2].large_cover_image)
            self.movie4.loadImageUsingCacheWithUrlString(randomMovies[3].large_cover_image)
            self.movie5.loadImageUsingCacheWithUrlString(randomMovies[4].large_cover_image)
            self.movie6.loadImageUsingCacheWithUrlString(randomMovies[5].large_cover_image)
        }

    }

    @objc func ExitHandle () {
    dismiss(animated: true, completion: nil)
    }
    @objc func pullToRefresh(_ refreshControl: UIRefreshControl) {
        // Update your conntent here
        modalTransitionStyle = .coverVertical
        BGIV.isHidden = true
        dismiss(animated: true, completion: nil)
        refreshControl.endRefreshing()
    }
    
    @objc func update() {
        let nextCollor = getNextColor()
        UIView.animate(withDuration: 0.5, animations: {
            self.separator.backgroundColor = nextCollor
        })
    }
    
    func getNextColor() -> UIColor {
        let currentColor = self.separator.backgroundColor
        
        if currentColor == UIColor.yellow {
            return UIColor.orange
        } else if currentColor == UIColor.green {
            return UIColor.yellow
        } else if currentColor == UIColor.init(red: 0/255, green: 153/255, blue: 204/255, alpha: 1) {
            return UIColor.red
        } else if currentColor == UIColor.orange {
            return UIColor.init(red: 0/255, green: 153/255, blue: 204/255, alpha: 1)
        } else if currentColor == UIColor.red {
            return UIColor.green
        } else {
            return UIColor.orange
        }
    }
    
    func randomNumber(range: ClosedRange<Int> = 1...6) -> Int {
        let min = range.lowerBound
        let max = range.upperBound
        return Int(arc4random_uniform(UInt32(1 + max - min))) + min
    }
    
    func Fetch(Limit:Int,Genre:String,offSet: Int,completion : @escaping (_ : [Movie]) -> Void)  {
        
        var arr : [Movie] = []
        
        apollo.fetch(query: FetchMoviesByGeLiOfQuery(genre: Genre, limit: Limit, offset: offSet) ) { (result, error) in
            
            if result != nil {
                for m in (result?.data?.movies)! {
                    let mov = Movie()
                    mov.title = m!.title
                    mov.movId = m!.imdbCode
                    mov.small_cover_image = m!.smallCoverImage
                    mov.medium_cover_image = m!.mediumCoverImage
                    mov.large_cover_image = m!.largeCoverImage
                    mov.background_Original = m?.backgroundImageOriginal
                    mov.year = m?.year
                    mov.ratingMpa = m?.mpaRating
                    mov.rating = m?.rating
                    mov.runtime = m?.runtime
                    mov.synopsis = m?.synopsis
                    mov.genres = m?.genres as! [String]
                    mov.trailerCode = m?.trailerCode
                    
                    arr.append(mov)
                }
               
                completion(arr)
            } else {
                print("Nothing : \(String(describing: error))")
            }
            
        }
        
    }
   
}
 extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
 }
 
 
 
