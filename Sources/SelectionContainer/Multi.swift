//
//  Multi.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/21.
//

import Foundation

public enum Multi {
    
    public struct List<Element: Identifiable>: MultiElementSelectionContainer where Element: Equatable, Element.Identifier: Hashable {
        
        public private(set) var elements: [Element] = []
        
        public init() {}
        
        public var elementCount: Int {
            return self.elements.count
        }
        
        public mutating func select(element: Element) {
            guard !self.elements.contains(element) else { return }
            self.elements.append(element)
        }
        
        public mutating func deselect(element: Element) {
            if let index = self.elements.index(of: element) {
                self.elements.remove(at: index)
            }
        }
        
        public func isSelected(of element: Element) -> Bool {
            return self.elements.contains(element)
        }
        
        public mutating func clear() {
            self.elements = []
        }
        
        public mutating func update<Container>(by elementContainer: Container) where Container: ElementContainer, Container.Element == Element {
            let mapping = elementContainer.elements.idMapping
            var new: Array<Element> = []
            self.elements.forEach { element in
                if let e = mapping[element.identifier] {
                    new.append(e)
                }
            }
            self.elements = new
        }
    }
    
    public struct Map<Element: Identifiable>: MultiElementSelectionContainer where Element: Hashable, Element.Identifier: Hashable {
        
        public var elements: [Element] {
            return Array(self.inner)
        }
        
        private var inner: Set<Element> = []
        
        public init() {}
        
        public var elementCount: Int {
            return self.inner.count
        }
        
        public mutating func select(element: Element) {
            guard !self.inner.contains(element) else { return }
            self.inner.insert(element)
        }
        
        public mutating func deselect(element: Element) {
            if let index = self.inner.index(of: element) {
                self.inner.remove(at: index)
            }
        }
        
        public func isSelected(of element: Element) -> Bool {
            return self.inner.contains(element)
        }
        
        public mutating func clear() {
            self.inner = []
        }
        
        public mutating func update<Container>(by elementContainer: Container) where Container: ElementContainer, Container.Element == Element {
            let mapping = elementContainer.elements.idMapping
            var new: Set<Element> = []
            self.inner.forEach { element in
                if let e = mapping[element.identifier] {
                    new.insert(e)
                }
            }
            self.inner = new
        }
    }
}
