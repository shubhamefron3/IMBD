//
//  ListTableViewCell.swift
//  SeekhoApp
//
//  Created by MacBook on 30/10/24.
//

import UIKit
import SDWebImage

final class ListTableViewCell: UITableViewCell {

    @IBOutlet private weak var posterimg: UIImageView!
    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var rating: UILabel!
    @IBOutlet private weak var ranking: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateView(model: PopularMovies){
        title.text = model.title
        rating.text = model.rating
        ranking.text = "\(model.rank ?? 0)"
        posterimg.sd_setImage(with: URL(string: model.bigImage ?? ""))
    }
}
