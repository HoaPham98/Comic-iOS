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

    @IBOutlet weak var categoryLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var arrayData = [ComicHomeModel]()
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 390, height: 220)
        self.collectionView.collectionViewLayout = flowLayout
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "ComicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ComicCollectionViewCell")
        
        ApiHomeManager.shared.getHomeComics { (success, data) in
            if success
            {
                let new = data!["newest"] as! [ComicHomeModel]
                self.arrayData = new
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    @IBAction func seeAllBtt(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpCell(category: String)
    {
        self.categoryLbl.text = category
    }
}

extension ComicTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return arrayData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComicCollectionViewCell", for: indexPath) as! ComicCollectionViewCell
        cell.setUpCell(data: arrayData[indexPath.row])
        return cell
    }
    
    
}
