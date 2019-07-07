//
//  DetailComicModel.swift
//  Comic
//
//  Created by HoaPQ on 7/7/19.
//  Copyright © 2019 HoaPQ. All rights reserved.
//

import Foundation
import SwiftyJSON

class DetailComicModel: NSObject {
    var id: Int = 0
    var title: String = ""
    var publisher: String = ""
    var status: String = ""
    var year: Int = 0
    var author: [String] = [String]()
    var genre: [String] = [String]()
    var summary: String = ""
    var numberIssues: Int = 0
    var cover: String = ""
    var issues: [Issue] = [Issue]()
    
    convenience init(json: JSON) {
        self.init()
        self.id = json["_id"].intValue
        self.title = json["title"].stringValue
        self.publisher = json["publisher"].stringValue
        self.status = json["status"].stringValue
        self.year = json["year"].intValue
        self.author = json["author"].arrayObject as! [String]
        self.genre = json["genre"].arrayObject as! [String]
        self.summary = json["summary"].stringValue
        self.numberIssues = json["number_issues"].intValue
        self.cover = json["cover"].stringValue
        for issueJson in json["issues"].arrayValue {
            let issue = Issue(json: issueJson)
            self.issues.append(issue)
        }
    }
}

class RelatedComic: NSObject {
    var id: Int = 0
    var title: String = ""
    var cover: String = ""
    
    convenience init(json: JSON) {
        self.init()
        self.id = json["id"].intValue
        self.title = json["title"].stringValue
        self.cover = json["cover"].stringValue
    }
}

class Issue: NSObject {
    var id: Int = 0
    var title: String = ""
    
    convenience init(json: JSON) {
        self.init()
        self.id = json["_id"].intValue
        self.title = json["title"].stringValue
    }
}

