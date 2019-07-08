//
//  CustomSummaryTableViewCell.swift
//  Comic
//
//  Created by Khánh Linh Lưu on 7/8/19.
//  Copyright © 2019 HoaPQ. All rights reserved.
//

import UIKit

class CustomSummaryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var summaryText: UITextView!
    
    
    var textSummary : String = "" {
        didSet {
            DispatchQueue.main.async {
                self.summaryText.frame.size.height = self.textSummary.height(withConstrainedWidth: self.summaryText.frame.size.width, font: UIFont.systemFont(ofSize: 17))
                self.summaryText.text = self.textSummary
                self.layoutIfNeeded()
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}
