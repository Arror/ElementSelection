//
//  SelectionItem.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/2.
//  Copyright © 2018年 Arror. All rights reserved.
//

import Foundation

public struct SelectionItem<ES: ElementSelection> {
    
    private weak var selection: ES?
    
    public let element: ES.Container.Element
    
    internal init(selection: ES, element: ES.Container.Element) {
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
