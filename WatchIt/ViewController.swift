//
//  ViewController.swift
//  WatchIt
//
//  Created by Jacob Peralta on 18/9/17.
//  Copyright © 2017 Jadapema. All rights reserved.
//

import UIKit
import FirebaseAuth
import Apollo

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIViewControllerPreviewingDelegate {
    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var largeView: UIView!
    @IBOutlet weak var actionView: UIView!
    @IBOutlet weak var adventureView: UIView!
    @IBOutlet weak var comedyView: UIView!
    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var fantasyView: UIView!
    @IBOutlet weak var sciFiView: UIView!
    
    @IBOutlet var SciFiCollectionView: UICollectionView!
    @IBOutlet var FantasyCollectionView: UICollectionView!
    @IBOutlet var AnimationCollectionView: UICollectionView!
    @IBOutlet var ComedyCollectionView: UICollectionView!
    @IBOutlet var AdventureCollectionView: UICollectionView!
    @IBOutlet var Search: UIImageView!
    @IBOutlet var ITlbl: UILabel!
    @IBOutlet var Menu: UIImageView!
    @IBOutlet var LargeMoviesCollectionView: UICollectionView!
    
    @IBOutlet var ActionCollectionView: UICollectionView!
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    let apollo = ApolloClient(url: URL(string: "http://54.201.26.159:4000/graphql")!)
    
    var categories = ["Action","Adventure","Comedy","Fantasy","Sci-Fi","Horror","Romance"]
    
    var ActionMovies : [Movie] = []
    var AdventureMovies : [Movie] = []
    var ComedyMovies : [Movie] = []
    var AnimationMovies : [Movie] = []
    var FantasyMovies : [Movie] = []
    var SciFiMovies : [Movie] = []
    var LargeMovies : [Movie] = []
    var SelectedMovie : Movie!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullToRefresh(_:)), for: .valueChanged)
        scroll.addSubview(refreshControl)
        
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: view)
        } else {
            print("Not Aviable 3D Touch")
        }
        
        self.navigationController?.isNavigationBarHidden = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        Menu.isUserInteractionEnabled = true
        Menu.addGestureRecognizer(tapGestureRecognizer)
        
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.revealViewController().rearViewRevealWidth = self.view.frame.width - 100
        
        LargeMoviesCollectionView.delegate = self
        LargeMoviesCollectionView.dataSource = self
        ActionCollectionView.delegate = self
        ActionCollectionView.dataSource = self
        AdventureCollectionView.delegate = self
        AdventureCollectionView.dataSource = self
        ComedyCollectionView.delegate = self
        ComedyCollectionView.dataSource = self
        AnimationCollectionView.delegate = self
        AnimationCollectionView.dataSource = self
        FantasyCollectionView.delegate = self
        FantasyCollectionView.dataSource = self
        SciFiCollectionView.delegate = self
        SciFiCollectionView.dataSource = self
        
        DispatchQueue.main.async(execute: {
            let _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        })
        
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(HandleLogOut), with: nil, afterDelay: 0)
        }
        
        Fetch(Limit: 10,Array: &ActionMovies, Genre: "Action")
        Fetch(Limit: 10,Array: &AdventureMovies, Genre: "Adventure")
        Fetch(Limit: 10,Array: &ComedyMovies, Genre: "Comedy")
        Fetch(Limit: 10,Array: &AnimationMovies, Genre: "Animation")
        Fetch(Limit: 10,Array: &FantasyMovies, Genre: "Action")
        Fetch(Limit: 10,Array: &SciFiMovies, Genre: "Sci-Fi")
        
        let randomGenre = categories[randomNumber(range: 0...categories.count)]
        let randomOffset = randomNumber(range: 1...110)
        self.Fetch(Limit: 8, Genre: randomGenre, offSet: randomOffset ) { (randomMovies) in
            print("movies : \(randomMovies.count), genre: \(randomGenre), offset: \(randomOffset)")
            
            self.LargeMovies = randomMovies
        }
        
        DispatchQueue.main.async(execute: {
            self.ActionCollectionView.reloadData()
        })

        
    }
    
    @objc func pullToRefresh(_ refreshControl: UIRefreshControl) {
        // Update your conntent here
        print("hello")
        refreshControl.endRefreshing()
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        print("point : \(location.x), \(location.y)")
        var bg : UIColor = UIColor.clear
        var cellE : UICollectionViewCell!
        if let cell = GetCellOfLocation(point: location, collectionView: LargeMoviesCollectionView)  {
            cellE = cell
            let locationCell : CGPoint = LargeMoviesCollectionView.convert(location, from: self.view)
            guard let indexPath = LargeMoviesCollectionView.indexPathForItem(at: locationCell) else {return nil}
            SelectedMovie = LargeMovies[indexPath.row]
            
        } else if let cell = GetCellOfLocation(point: location, collectionView: ActionCollectionView)  {
            cellE = cell
            let locationCell : CGPoint = ActionCollectionView.convert(location, from: self.view)
            guard let indexPath = ActionCollectionView.indexPathForItem(at: locationCell) else {return nil}
            SelectedMovie = ActionMovies[indexPath.row]
        } else if let cell = GetCellOfLocation(point: location, collectionView: AdventureCollectionView)  {
            cellE = cell
            let locationCell : CGPoint = AdventureCollectionView.convert(location, from: self.view)
            guard let indexPath = AdventureCollectionView.indexPathForItem(at: locationCell) else {return nil}
            SelectedMovie = AdventureMovies[indexPath.row]
        } else if let cell = GetCellOfLocation(point: location, collectionView: ComedyCollectionView)  {
            cellE = cell
            let locationCell : CGPoint = ComedyCollectionView.convert(location, from: self.view)
            guard let indexPath = ComedyCollectionView.indexPathForItem(at: locationCell) else {return nil}
            SelectedMovie = ComedyMovies[indexPath.row]
        } else if let cell = GetCellOfLocation(point: location, collectionView: AnimationCollectionView)  {
            cellE = cell
            let locationCell : CGPoint = AnimationCollectionView.convert(location, from: self.view)
            guard let indexPath = AnimationCollectionView.indexPathForItem(at: locationCell) else {return nil}
            SelectedMovie = AnimationMovies[indexPath.row]
        } else if let cell = GetCellOfLocation(point: location, collectionView: FantasyCollectionView)  {
            cellE = cell
            let locationCell : CGPoint = FantasyCollectionView.convert(location, from: self.view)
            guard let indexPath = FantasyCollectionView.indexPathForItem(at: locationCell) else {return nil}
            SelectedMovie = FantasyMovies[indexPath.row]
        } else if let cell = GetCellOfLocation(point: location, collectionView: SciFiCollectionView)  {
           cellE = cell
            let locationCell : CGPoint = SciFiCollectionView.convert(location, from: self.view)
            guard let indexPath = SciFiCollectionView.indexPathForItem(at: locationCell) else {return nil}
            SelectedMovie = SciFiMovies[indexPath.row]
        }
        
        if cellE != nil {
            bg = cellE.backgroundColor!
            let previewVC = storyboard?.instantiateViewController(withIdentifier: "prevMovie") as! PreviewViewController
            previewVC.selectedMovie = self.SelectedMovie
            previewVC.preferredContentSize = CGSize(width: 0.0, height: 370)
            return previewVC
        } else {
            return nil
        }
    }
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
        let vc = viewControllerToCommit as! PreviewViewController
        
        let finalVC = storyboard?.instantiateViewController(withIdentifier: "MovieDetail") as! MovieDetailViewController
        finalVC.background = vc.backGroundColor
        finalVC.SelectedMovie = vc.selectedMovie
        present(finalVC, animated: true, completion: nil)
        modalTransitionStyle = .crossDissolve
    }
    
    func GetCellOfLocation (point : CGPoint, collectionView : UICollectionView) -> UICollectionViewCell? {
        let locationCell : CGPoint = collectionView.convert(point, from: self.view)
        guard let indexPath = collectionView.indexPathForItem(at: locationCell) else {
            return nil
        }
        
        print("indexPath.row :: \(indexPath.row)")
        guard let cell = collectionView.cellForItem(at: indexPath) else { return nil }
        return cell
    }
    
    func randomNumber(range: ClosedRange<Int> = 1...6) -> Int {
        let min = range.lowerBound
        let max = range.upperBound
        return Int(arc4random_uniform(UInt32(1 + max - min))) + min
    }
    
    @objc func HandleMenu () {
        
    }
    
    @objc func HandleSearch () {
        
    }
    
    //Handle to Logout
    @objc func HandleLogOut () {
        do {
            try FIRAuth.auth()?.signOut()
        } catch let LogoutError {
            print("Error al salir de la sesion \(LogoutError)")
        }
        
        if let LogIn = self.storyboard?.instantiateViewController(withIdentifier: "LogIn")  {
            present(LogIn, animated: true) {
                print("Exito")
            }
        }
    }
    
    @objc func update() {
        let nextCollor = getNextColor()
        UIView.animate(withDuration: 0.5, animations: {
            self.ITlbl.textColor = nextCollor
        })
    }
    
    func getNextColor() -> UIColor {
        let currentColor = self.ITlbl.textColor
        
        
        if currentColor == UIColor.yellow {
            return UIColor.orange
        } else if currentColor == UIColor.green {
            return UIColor.yellow
        } else if currentColor == UIColor.init(red: 0, green: 153, blue: 204, alpha: 1) {
            return UIColor.red
        } else if currentColor == UIColor.orange {
            return UIColor.init(red: 0, green: 153, blue: 204, alpha: 1)
        } else if currentColor == UIColor.red {
            return UIColor.green
        } else {
            return UIColor.orange
        }
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == LargeMoviesCollectionView {
            if LargeMovies.isEmpty {
                return 10
            } else {
                return LargeMovies.count
            }
        } else if collectionView == ActionCollectionView  {
            if ActionMovies.isEmpty {
                return 10
            } else {
                return ActionMovies.count
            }
        } else if collectionView == AdventureCollectionView {
            if AdventureMovies.isEmpty {
                return 10
            } else {
                return AdventureMovies.count
            }
        } else if collectionView == ComedyCollectionView {
            if ComedyMovies.isEmpty {
                return 10
            } else {
                return ComedyMovies.count
            }
        } else if collectionView == AnimationCollectionView {
            if AnimationMovies.isEmpty {
                return 10
            } else {
                return AnimationMovies.count
            }
        } else if collectionView == FantasyCollectionView {
            if FantasyMovies.isEmpty {
                return 10
            } else {
                return FantasyMovies.count
            }
        } else if collectionView == SciFiCollectionView {
            if SciFiMovies.isEmpty {
                return 10
            } else {
                return SciFiMovies.count
            }
        } else {
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        collectionView.backgroundColor = UIColor.clear
        
        if collectionView == LargeMoviesCollectionView {
            let cell = LargeMoviesCollectionView.dequeueReusableCell(withReuseIdentifier: "Large", for: indexPath) as! MovieCollectionViewCell
            if !LargeMovies.isEmpty {
            cell.CoverImage.loadImageUsingCacheWithUrlString(LargeMovies[indexPath.row].medium_cover_image)
            }
            cell.backgroundColor = #colorLiteral(red: 0, green: 0.479084909, blue: 0.6649822593, alpha: 1)
            return cell
        } else if collectionView == ActionCollectionView {
            let cell = ActionCollectionView.dequeueReusableCell(withReuseIdentifier: "Action", for: indexPath) as! MovieCollectionViewCell
            if !ActionMovies.isEmpty {
            cell.CoverImage.loadImageUsingCacheWithUrlString(ActionMovies[indexPath.row].medium_cover_image)
            }
            cell.backgroundColor = #colorLiteral(red: 0, green: 0.6532471776, blue: 0.4756888151, alpha: 1)
            return cell
        } else if collectionView == AdventureCollectionView {
            let cell = AdventureCollectionView.dequeueReusableCell(withReuseIdentifier: "Adventure", for: indexPath) as! MovieCollectionViewCell
            if !AdventureMovies.isEmpty {
            cell.CoverImage.loadImageUsingCacheWithUrlString(AdventureMovies[indexPath.row].medium_cover_image)
            }
            cell.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
            return cell
        } else if collectionView == ComedyCollectionView {
            let cell = ComedyCollectionView.dequeueReusableCell(withReuseIdentifier: "Comedy", for: indexPath) as! MovieCollectionViewCell
            if !ComedyMovies.isEmpty {
            cell.CoverImage.loadImageUsingCacheWithUrlString(ComedyMovies[indexPath.row].medium_cover_image)
            }
            cell.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            return cell
        } else if collectionView == AnimationCollectionView  {
            let cell = AnimationCollectionView.dequeueReusableCell(withReuseIdentifier: "Animation", for: indexPath) as! MovieCollectionViewCell
            if !AnimationMovies.isEmpty {
            cell.CoverImage.loadImageUsingCacheWithUrlString(AnimationMovies[indexPath.row].medium_cover_image)
            }
            cell.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            return cell
        } else if collectionView == FantasyCollectionView {
            let cell = FantasyCollectionView.dequeueReusableCell(withReuseIdentifier: "Fantasy", for: indexPath) as! MovieCollectionViewCell
            if !FantasyMovies.isEmpty {
            cell.CoverImage.loadImageUsingCacheWithUrlString(FantasyMovies[indexPath.row].medium_cover_image)
            }
            cell.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
            return cell
        } else if collectionView == SciFiCollectionView {
            let cell = SciFiCollectionView.dequeueReusableCell(withReuseIdentifier: "SciFi", for: indexPath) as! MovieCollectionViewCell
            if !SciFiMovies.isEmpty {
            cell.CoverImage.loadImageUsingCacheWithUrlString(SciFiMovies[indexPath.row].medium_cover_image)
            }
            cell.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
            return cell
        } else {
            let cell = UICollectionViewCell ()
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == LargeMoviesCollectionView {
            if !LargeMovies.isEmpty {
            SelectedMovie = LargeMovies[indexPath.row]
            }
        } else if collectionView == ActionCollectionView {
            if !ActionMovies.isEmpty {
            SelectedMovie = ActionMovies[indexPath.row]
            }
        } else if collectionView == AdventureCollectionView {
            if !AdventureMovies.isEmpty {
            SelectedMovie = AdventureMovies[indexPath.row]
            }
        } else if collectionView == ComedyCollectionView {
            if !ComedyMovies.isEmpty {
            SelectedMovie = ComedyMovies[indexPath.row]
            }
        } else if collectionView == AnimationCollectionView  {
            if !AnimationMovies.isEmpty {
            SelectedMovie = AnimationMovies[indexPath.row]
            }
        } else if collectionView == FantasyCollectionView {
            if !FantasyMovies.isEmpty {
            SelectedMovie = FantasyMovies[indexPath.row]
            }
        } else if collectionView == SciFiCollectionView {
            if !SciFiMovies.isEmpty {
            SelectedMovie = SciFiMovies[indexPath.row]
            }
        }
        
        if SelectedMovie != nil {
            performSegue(withIdentifier: "MovieDetail", sender: self)
        }
    }
    
    func Fetch(Limit:Int,Array : inout [Movie],Genre:String)  {
    
        var arr : [Movie] = []
    
        apollo.fetch(query: FetchMoviesByGeLiQuery(genre: Genre, limit: Limit) ) { (result, error) in

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
                    DispatchQueue.main.async(execute: {
                        asign()
                        self.LargeMoviesCollectionView.reloadData()
                        self.ActionCollectionView.reloadData()
                        self.AdventureCollectionView.reloadData()
                        self.AnimationCollectionView.reloadData()
                        self.SciFiCollectionView.reloadData()
                        self.ComedyCollectionView.reloadData()
                        self.FantasyCollectionView.reloadData()
                    })
                }
            } else {
                print("Nothing : \(error)")
            }

        }
        func asign () {
            Array = arr
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MovieDetail" {
            let MovDet = segue.destination as! MovieDetailViewController
            MovDet.SelectedMovie = self.SelectedMovie
            MovDet.background = #colorLiteral(red: 0.1036974415, green: 0.1036974415, blue: 0.1036974415, alpha: 1)
        }
    }

}


let imageCache = NSCache<NSString, AnyObject>()
extension UIImageView {
    func loadImageUsingCacheWithUrlString(_ urlString: String) {
        self.image = nil
        //check cache for image first
        if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = cachedImage
            return
        }
        //otherwise fire off a new download
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            //download hit an error so lets return out
            if let error = error {
                print(error)
                return
            }
            DispatchQueue.main.async(execute: {
                if let downloadedImage = UIImage(data: data!) {
                    imageCache.setObject(downloadedImage, forKey: urlString as NSString)
                    self.image = downloadedImage
                }
            })
        }).resume()
    }
}

