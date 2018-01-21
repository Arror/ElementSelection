//
//  MultiElementContainer.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/2.
//  Copyright © 2018年 Arror. All rights reserved.
//

import Foundation

extension Array: MultiElementSelectionContainer where Iterator.Element: Equatable & Identifiable, Iterator.Element.Identifier: Hashable {
    
    public var elements: [Element] {
        return self
    }
    
    public var elementCount: Int {
        return self.count
    }
    
    public func isSelected(of element: Element) -> Bool {
        return self.contains(element)
    }
    
    public mutating func select(element: Element) {
        self.append(element)
    }
    
    public mutating func deselect(element: Element) {
        if let index = self.index(of: element) {
            self.remove(at: index)
        }
    }
    
    public mutating func clear() {
        self.removeAll()
    }
    
    public mutating func update<Container>(by elementContainer: Container) where Container: ElementContainer, Container.Element: Identifiable, Container.Element== Element {
        let mapping = elementContainer.elements.idMapping
        var new: Array<Iterator.Element> = []
        self.forEach { element in
            if let e = mapping[element.identifier] {
                new.append(e)
            }
        }
        self = new
    }
}

extension Set: MultiElementSelectionContainer where Iterator.Element: Identifiable, Iterator.Element.Identifier: Hashable {
    
    public var elements: [Element] {
        return Array(self)
    }
    
    public var elementCount: Int {
        return self.count
    }
    
    public func isSelected(of element: Element) -> Bool {
        return self.contains(element)
    }
    
    public mutating func select(element: Element) {
        self.insert(element)
    }
    
    public mutating func deselect(element: Element) {
        self.remove(element)
    }
    
    public mutating func clear() {
        self.removeAll()
    }
    
    public mutating func update<Container>(by elementContainer: Container) where Container: ElementContainer, Container.Element: Identifiable, Container.Element == Element {
        let mapping = elementContainer.elements.idMapping
        var new: Set<Iterator.Element> = []
        self.forEach { element in
            if let e = mapping[element.identifier] {
                new.insert(e)
            }
        }
        self = new
    }
}
