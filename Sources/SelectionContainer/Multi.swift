//
//  Multi.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/21.
//

import Foundation

extension Collection where Iterator.Element: Hashable {
    
    var elementMapping: [Int: Iterator.Element] {
        var reval: [Int: Iterator.Element] = [:]
        self.forEach { reval[$0.hashValue] = $0 }
        return reval
    }
}

public enum Multi {
    
    public struct Array<Element>: MultiElementSelectionContainer where Element: Hashable {
        
        public private(set) var elements: Swift.Array<Element> = []
        
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
            let mapping = elementContainer.elements.elementMapping
            var new: Swift.Array<Element> = []
            self.elements.forEach { element in
                if let e = mapping[element.hashValue] {
                    new.append(e)
                }
            }
            self.elements = new
        }
    }
    
    public struct Set<Element>: MultiElementSelectionContainer where Element: Hashable {
        
        public var elements: [Element] {
            return Swift.Array(self.inner)
        }
        
        private var inner: Swift.Set<Element> = []
        
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
            let mapping = elementContainer.elements.elementMapping
            var new: Swift.Set<Element> = []
            self.inner.forEach { element in
                if let e = mapping[element.hashValue] {
                    new.insert(e)
                }
            }
            self.inner = new
        }
    }
}
