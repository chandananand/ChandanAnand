//
//  ViewController.swift
//  ChandanAnand
//
//  Created by Ayeesha on 06/12/17.
//  Copyright © 2017 Ayeesha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var Program = "Program"
    var movieShowsList:[MoviesModel]?
    var tvShowsList:[TvModel]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.getProgramList(filename: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func moviesBtnClicked(_ sender: Any) {
        movieShowsList = getProgramList(filename: "movies") as? [MoviesModel]
        performSegue(withIdentifier: Program, sender: "movies")
    }
    
    @IBAction func tvShowsBtnClicked(_sender: Any){
        tvShowsList = getProgramList(filename: "tvshows") as? [TvModel]
        performSegue(withIdentifier: Program, sender: "tvshows")
    }
    
    func getProgramList(filename:String) -> [Any]? {
        
      /*  let urlString = "http://microblogging.wingnity.com/JSONParsingTutorial/jsonActors"
        
        let url = NSURL(string: urlString)
        
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler:{(data,responds,error) -> Void in
            
*/
        if let path = Bundle.main.path(forResource: filename, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let jsonResult = json as? Dictionary<String, AnyObject>,
                    
                    let infolist = jsonResult[filename] as? [Any] {
                    var programList = [Any]()
                    if filename == "movies" {
                        
                        for list in infolist {
                            let movies = MoviesModel(json: (list as? [String:Any])!)
                            programList.append(movies)
                        }
                    }else {
                        for list in infolist {
                            let tvShow = TvModel(json: (list as? [String:Any])!)
                            programList.append(tvShow)
                        }
                    }
                    return programList
                }
            } catch {
                print("Failed to covert json")
            }
        }
        return nil
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Program {
            let programList = segue.destination as? ProgramViewController
            programList?.type = sender as? String
            programList?.viewController = self
        }
    }
}

