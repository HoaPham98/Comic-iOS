//
//  CustomTopTableViewCell.swift
//  Comic
//
//  Created by Khánh Linh Lưu on 7/8/19.
//  Copyright © 2019 HoaPQ. All rights reserved.
//

import UIKit

class CustomTopTableViewCell: UITableViewCell {
    
    @IBOutlet weak var comicName: UILabel!
    
    @IBOutlet weak var posterImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
