//
//  ComicTableViewCell.swift
//  Comic
//
//  Created by Yami No Mid on 7/7/19.
//  Copyright © 2019 HoaPQ. All rights reserved.
//

import UIKit
import Kingfisher

class ComicTableViewCell: UITableViewCell {

    @IBOutlet weak var comicImage: UIImageView!
    @IBOutlet weak var comicNameLbl: UILabel!
    @IBOutlet weak var comicNameIssue: UILabel!
    @IBOutlet weak var starRateLbl: UILabel!
    @IBOutlet weak var starRateView: UIView!
    @IBOutlet weak var ratingLbl: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        self.comicImage.layer.cornerRadius = self.comicImage.frame.width/7
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(data: ComicHomeModel)
    {
        self.comicImage.kf.setImage(with: URL(string: data.img)!)
        self.comicNameLbl.text = data.title
        self.comicNameIssue.text = data.lastIssue
    }
    
    @IBAction func likeButton(_ sender: Any)
    {
        
    }
    
}
