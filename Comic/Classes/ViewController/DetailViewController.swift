//
//  DetailViewController.swift
//  Comic
//
//  Created by Khánh Linh Lưu on 7/8/19.
//  Copyright © 2019 HoaPQ. All rights reserved.
//

import UIKit
import Kingfisher

struct InfoDetail {
    let posterImage:String?
    let comicName:String?
    let year:Int?
    let category:String?
    let isRead:Bool?
    let isFavorite:Bool?
    let averageVote:Float?
    let numberOfRating:Int?
    let numberOfReview:Int?
    let numberOfLike:Int?
    let summary:String?
}

class DetailViewController: UIViewController {
    
    var data = [InfoDetail]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = [InfoDetail.init(posterImage: "https://www.dccomics.com/sites/default/files/styles/covers192x291/public/comic-covers/2018/12/ADVSUPSO_06_300-001_HD_5c17f6a7b9c910.85860963.jpg?itok=g04O7GQ_", comicName: "Adventure of the Super Sons (2018)", year: 2018, category: "DC Comics", isRead: false, isFavorite: false, averageVote: 4.5, numberOfRating: 213, numberOfReview: 10, numberOfLike: 200, summary: "Takron-Galtos, the prison planet, may be behind them—but in order to beat the Gang and get home, the boys must saddle up to survive a wild wild world of the west! An unlikely guide on this lawless planet might just help Superboy and Robin survive…but what in the west world is Jonah Hex doing out here in space?! Hold on to your hats, this one’s going to be a bucking good time!")]
        
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 120
        self.tableView.register(UINib(nibName: "CustomTopTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTopCell")
        self.tableView.register(UINib(nibName: "CustomSummaryTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomSummaryCell")
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let url = URL(string: data[0].posterImage!)!
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTopCell") as! CustomTopTableViewCell
            cell.comicName.text = data[0].comicName
            cell.posterImage?.kf.setImage(with: url)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomSummaryCell") as! CustomSummaryTableViewCell
            cell.textSummary = data[0].summary!
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return UITableView.automaticDimension
        } else {
            return 22 + data[0].summary!.height(withConstrainedWidth:self.view.frame.width, font:  UIFont.systemFont(ofSize: 17))
        }
    }
}
