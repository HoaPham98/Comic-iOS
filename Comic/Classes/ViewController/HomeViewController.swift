//
//  HomeViewController.swift
//  Comic
//
//  Created by Yami No Mid on 7/7/19.
//  Copyright © 2019 HoaPQ. All rights reserved.
//

import UIKit
@IBDesignable class RoundButton: UIButton
{
    @IBInspectable var cornerRadius: CGFloat = 15
        // nếu mà không đặt thì để là 15
        {  // cho phép thay đổi thuộc tính qua trình theo dõi thuộc tính.
        didSet
        {
            refreshCorners(value: cornerRadius)
        }
    }
    
    // dành cho tạo button bằng code
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        sharedInit()
    }
    // dành cho auto layout.
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() // dùng để rendering IBDesignable
        
    {
        sharedInit()
    }
    
    func sharedInit()
    {
        refreshCorners(value: cornerRadius)
    }
    
    func refreshCorners(value: CGFloat) // cập nhật corner bán kính
    {
        layer.cornerRadius = value
    }
}


class HomeViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    var arrayData = [ComicHomeModel]()
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "ComicTableViewCell", bundle: nil), forCellReuseIdentifier: "ComicTableViewCell")
        ApiHomeManager.shared.getDetail { (status, data) in
            
        }
        ApiHomeManager.shared.getHomeComics
        { (status, data) in
            let newest = data!["newest"] as! [ComicHomeModel]
            DispatchQueue.main.async
            {
                self.arrayData = newest
                self.tableView.reloadData()
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComicTableViewCell", for: indexPath) as! ComicTableViewCell
        cell.setUpCell(data: arrayData[indexPath.row])
        
        return cell
    }
    
    
}
