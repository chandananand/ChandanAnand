//
//  ProgramTableViewCell.swift
//  ChandanAnand
//
//  Created by Ayeesha on 06/12/17.
//  Copyright © 2017 Ayeesha. All rights reserved.
//

import UIKit

class ProgramTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var listLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func movieCell(movie:MoviesModel) {
        titleLabel.text = movie.name
        ratingLabel.text = movie.rating
        listLabel.text = movie.cast?.joined(separator: ",")
    }
    
    func tvShowsCell(tvShow:TvModel) {
        titleLabel.text = tvShow.name
        ratingLabel.text = tvShow.seasons
        listLabel.text = tvShow.episodes?.joined(separator: ",")
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
