//
//  SelectionItem.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/2.
//  Copyright © 2018年 Arror. All rights reserved.
//

import Foundation

public struct SelectionItem<Selection: ElementSelection> {
    
    private weak var selection: Selection?
    
    public let element: Selection.Container.Element
    
    internal init(selection: Selection, element: Selection.Container.Element) {
        self.selection = selection
        self.element = element
    }
    
    public var isSelected: Bool {
        set {
            self.selection?.set(selected: newValue, for: self.element)
        }
        get {
            return self.selection?.isSelected(of: self.element) ?? false
        }
    }
}
