//
//  SecondViewController.swift
//  Ndela054-UPEApp
//
//  Created by user175850 on 7/31/20.
//  Copyright © 2020 user175850. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {
    
    let tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(CalendarTableCell.self, forCellReuseIdentifier: "cellId")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CalendarTableCell
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
