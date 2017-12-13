//
//  MoviesModalClass.swift
//  ChandanAnand
//
//  Created by Ayeesha on 06/12/17.
//  Copyright © 2017 Ayeesha. All rights reserved.
//

import UIKit

class MoviesModel: NSObject {
    
    var name:String?
    var rating:String?
    var cast:[String]?
    init(json:[String:Any]) {
        name = json["name"] as? String
        rating = json["rating"] as? String
        let actors = json["cast"] as? [String]
        cast = []
        for actor in actors! {
            cast?.append(actor)
        }
    }
}


class TvModel: NSObject {
    var name:String?
    var seasons:String?
    var episodes:[String]?
    
    init(json:[String:Any]) {
        name = json["name"] as? String
        seasons = json["seasons"] as? String
        let episodeList = json["episodes"] as? [String]
        episodes = []
        for actor in episodeList! {
            episodes?.append(actor)
        }
    }
}
