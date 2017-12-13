//
//  APIManager.swift
//  ChandanAnand
//
//  Created by Chandan Anand on 12/7/17.
//  Copyright © 2017 Ayeesha. All rights reserved.
//

import Foundation


//class APIManager{
//
//    func getProgramList(filename:String) -> [Any]? {
//
//        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
//            do {
//                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//
//                let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
//
//                if let jsonResult = json as? Dictionary<String, AnyObject>,
//
//                    let infolist = jsonResult[filename] as? [Any] {
//                    var programList = [Any]()
//                    if filename == "movies" {
//
//                        for list in infolist {
//                            let movies = MoviesModalClass(json: (list as? [String:Any])!)
//                            programList.append(movies)
//                        }
//                    }else {
//                        for list in infolist {
//                            let tvShow = TvModalClass(json: (list as? [String:Any])!)
//                            programList.append(tvShow)
//                        }
//                    }
//                    return programList
//                }
//            } catch {
//                print("Failed to covert json")
//            }
//        }
//        return nil
//    }
//}

