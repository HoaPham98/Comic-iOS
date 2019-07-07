//
//  ComicHomeModel.swift
//  Comic
//
//  Created by HoaPQ on 7/7/19.
//  Copyright © 2019 HoaPQ. All rights reserved.
//

import Foundation
import SwiftyJSON

class ComicHomeModel: NSObject {
    var id: Int = 0
    var title: String = ""
    var lastIssue: String = ""
    var img: String = ""
    
    convenience init(json: JSON) {
        self.init()
        self.id = json["id"].intValue
        self.title = json["title"].stringValue
        self.lastIssue = json["issue_name"].stringValue
        self.img = json["img"].stringValue
    }
}
