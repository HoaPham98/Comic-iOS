//
//  HomeViewController.swift
//  Comic
//
//  Created by Yami No Mid on 7/7/19.
//  Copyright © 2019 HoaPQ. All rights reserved.
//

import UIKit

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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComicTableViewCell", for: indexPath) as! ComicTableViewCell
        
        
        return cell
    }
    
    
}
