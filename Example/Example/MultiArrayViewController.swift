//
//  MultiArrayViewController.swift
//  Example
//
//  Created by Arror on 2018/1/21.
//  Copyright © 2018年 Arror. All rights reserved.
//

import UIKit
import ElementSelection

class MultiArrayViewController: UITableViewController {

    private let controller = PersonController()
    
    private lazy var selection = LimitMultiSelection(inner: MultiSelection(container: self.controller, selectionContainerType: Multi.Array.self), limit: 5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Multi Selection - Array"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(MultiArrayViewController.doneButtnTapped(_:)))
    }
    
    @objc private func doneButtnTapped(_ sender: UIBarButtonItem) {
        let message: String = {
            let elements = self.selection.elements
            if elements.isEmpty {
                return "No selection"
            } else {
                return elements.map { $0.description }.joined(separator: "\n")
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
        if !isSelected && self.selection.isFull {
            let alert = UIAlertController(title: "Notice", message: "Limit: \(self.selection.limit)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            self.selection.set(selected: !isSelected, for: person)
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}
