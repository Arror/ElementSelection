//
//  Radio.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/2.
//  Copyright © 2018年 Arror. All rights reserved.
//

import Foundation

public struct Radio<Element: Equatable>: RadioElementSelectionContainer {
    
    public private(set) var element: Element?
    
    public init() {}
    
    public var elementCount: Int {
        return self.element == nil ? 0 : 1
    }
    
    public mutating func select(element: Element) {
        self.element = element
    }
    
    public mutating func deselect(element: Element) {
        if let e = self.element, e == element {
            self.element = nil
        }
    }
    
    public func isSelected(of element: Element) -> Bool {
        if let e = self.element {
            return element == e
        } else {
            return false
        }
    }
    
    public mutating func clear() {
        self.element = nil
    }
    
    public mutating func update<Container>(by elementContainer: Container) where Container: ElementContainer, Container.Element == Element {
        let elements = elementContainer.elements
        if let e = self.element, let index = elements.index(of: e) {
            self.element = elements[index]
        } else {
            self.element = nil
        }
    }
}
