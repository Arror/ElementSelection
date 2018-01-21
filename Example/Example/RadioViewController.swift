//
//  RadioViewController.swift
//  Example
//
//  Created by Arror on 2018/1/21.
//  Copyright © 2018年 Arror. All rights reserved.
//

import UIKit
import ElementSelection

class RadioViewController: UITableViewController {

    private let controller = PersonController()
    
    private lazy var selection = RadioSelection(container: self.controller, selectionContainerType: Radio.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Radio Selection"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(RadioViewController.doneButtnTapped(_:)))
    }
    
    @objc private func doneButtnTapped(_ sender: UIBarButtonItem) {
        let message: String = {
            if let element = self.selection.element {
                return element.description
            } else {
                return "No selection"
            }
        }()
        let alert = UIAlertController(title: "Result", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
        if self.selection.isSelected(of: person) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = self.controller.elements[indexPath.row]
        let isSelected = self.selection.isSelected(of: person)
        self.selection.set(selected: !isSelected, for: person)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}
