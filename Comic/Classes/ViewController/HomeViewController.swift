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
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        self.tableView.register(UINib(nibName: "ComicTableViewCell", bundle: nil), forCellReuseIdentifier: "ComicTableViewCell")
        
        
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComicTableViewCell", for: indexPath) as! ComicTableViewCell
        if indexPath.row == 0
        {
            cell.setUpCell(category: "Top Read Comics")
            return cell
        }
        else if indexPath.row == 1
        {
            cell.setUpCell(category: "Newest Comics")
            return cell
        }
        else
        {
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}
