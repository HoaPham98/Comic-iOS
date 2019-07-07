//
//  ComicTableViewCell.swift
//  Comic
//
//  Created by Yami No Mid on 7/7/19.
//  Copyright © 2019 HoaPQ. All rights reserved.
//

import UIKit

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
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func setUpCell(comicImage: UIImage)
//    {
//        <#function body#>
//    }
    
    @IBAction func likeButton(_ sender: Any)
    {
        
    }
    
}
