//
//  ComicCollectionViewCell.swift
//  Comic
//
//  Created by Yami No Mid on 7/14/19.
//  Copyright © 2019 HoaPQ. All rights reserved.
//

import UIKit
import Kingfisher

class ComicCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var comicImage: UIImageView!
    @IBOutlet weak var comicName: UILabel!
    @IBOutlet weak var comicIssue: UILabel!
    @IBOutlet weak var comicRatedStar: UILabel!
    @IBOutlet weak var comicStarView: UIView!
    @IBOutlet weak var comicRating: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        self.comicImage.layer.cornerRadius = self.comicImage.frame.width / 7
    }
    @IBAction func likeBtt(_ sender: Any)
    {
        
    }
    
    func setUpCell(data: ComicHomeModel)
    {
        self.comicImage.kf.setImage(with: URL(string: data.img)!)
        self.comicName.text = data.title
        self.comicIssue.text = data.lastIssue
    }
    
}
