//
//  Set.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/21.
//

import Foundation

extension Set: MultiElementSelectionContainer where Iterator.Element: Identifiable, Iterator.Element.Identifier: Hashable {
    
    public var elements: [Element] {
        // Compile Error
        // return Array(self)
        var arr: [Element] = []
        self.forEach { arr.append($0) }
        return arr
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
