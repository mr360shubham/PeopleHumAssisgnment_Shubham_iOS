//
//  MovieCollectionTableViewCell.swift
//  PeopleHumAssignment
//
//  Created by Shubham Baliyan on 05/07/24.
//

import UIKit

class MovieCollectionTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var animeTitle: UILabel!
    
    
    @IBOutlet weak var animeUrl: UILabel!
    
    @IBOutlet weak var animeScore: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
