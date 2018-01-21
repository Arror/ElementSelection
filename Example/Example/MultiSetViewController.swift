//
//  MultiSetViewController.swift
//  Example
//
//  Created by Arror on 2018/1/21.
//  Copyright © 2018年 Arror. All rights reserved.
//

import UIKit

class MultiSetViewController: UITableViewController {

    private let controller = PersonController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Radio Selection - Set"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.controller.elements.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuse", for: indexPath)
        let person = self.controller.elements[indexPath.row]
        cell.textLabel?.text = person.name
        cell.detailTextLabel?.text = "ID: \(person.id)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}
