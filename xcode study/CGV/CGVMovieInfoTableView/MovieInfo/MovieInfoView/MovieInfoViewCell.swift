//
//  MovieInfoViewCell.swift
//  LoginView
//
//  Created by Maru on 28/11/2018.
//  Copyright © 2018 Maru. All rights reserved.
//

import UIKit

class MovieInfoViewCell: UITableViewCell {

    
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var directorTextLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var genreTextLabel: UILabel!
    
    @IBOutlet weak var openDateLabel: UILabel!
    @IBOutlet weak var openDateTextLabel: UILabel!
    
    @IBOutlet weak var actorLabel: UILabel!
    @IBOutlet weak var actorTextLabel: UILabel!
    
    @IBOutlet weak var runningTimeLabel: UILabel!
    @IBOutlet weak var runningTimeTextLabel: UILabel!
    
    func setMovieInfo(movieInfo: MovieInfo) {
        directorTextLabel.text = movieInfo.director
        genreTextLabel.text = movieInfo.genre
        openDateTextLabel.text = movieInfo.openDate
        actorTextLabel.text = movieInfo.actor
        runningTimeTextLabel.text = movieInfo.runningTime
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
