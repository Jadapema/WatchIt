//
//  Movie.swift
//  WatchIt
//
//  Created by Jacob Peralta on 22/9/17.
//  Copyright © 2017 Jadapema. All rights reserved.
//

import Foundation
import UIKit

class Movie : NSObject {
    var title : String!
    var movId : String!
    var year : Int!
    var ratingMpa : String!
    var rating : Double!
    var runtime : Double!
    var synopsis : String!
    var genres : [String]!
    var trailerCode : String!
    var small_cover_image : String!
    var medium_cover_image : String!
    var large_cover_image : String!
    var background_Original : String!
    
    override init() {}
    
}
