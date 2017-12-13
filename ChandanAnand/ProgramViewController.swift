//
//  ProgramViewController.swift
//  ChandanAnand
//
//  Created by Ayeesha on 06/12/17.
//  Copyright © 2017 Ayeesha. All rights reserved.
//

import UIKit

class ProgramViewController: UIViewController {
    
    var viewController : ViewController?
    var type:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailList" {
            let detailList = segue.destination as? DetailsViewController
            detailList?.detailList = sender as? [String]
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ProgramViewController:UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if type == "movies" {
            return (viewController?.movieShowsList?.count)!
        }
        return (viewController?.tvShowsList?.count)!
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgramTableViewCell", for: indexPath) as? ProgramTableViewCell
        if type == "movies" {
            cell?.movieCell(movie: (viewController?.movieShowsList![indexPath.row])!)
        }else {
            cell?.tvShowsCell(tvShow:(viewController?.tvShowsList![indexPath.row])!)
        }
        return cell!
    }
}

extension ProgramViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if type == "movies" {
            performSegue(withIdentifier: "DetailList", sender: viewController?.movieShowsList![indexPath.row].cast)
        }else {
            performSegue(withIdentifier: "DetailList", sender: viewController?.tvShowsList![indexPath.row].episodes)
        }
        
    }
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

