//
//  MultiSelectionBox.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/21.
//

import Foundation

open class MultiSelectionBox<MES: MultiElementSelection>: AbstractMultiSelection<MES.Container, MES.MultiSelectionContainer> {
    
    public let inner: MES
    
    public init(inner: MES) {
        self.inner = inner
    }
    
    open override var elements: [MES.Container.Element] {
        return self.inner.elements
    }
    
    open override func isSelected(of element: MES.Container.Element) -> Bool {
        return self.inner.isSelected(of: element)
    }
    
    open override func set(selected isSelected: Bool, for element: MES.Container.Element) {
        self.inner.set(selected: isSelected, for: element)
    }
    
    open override func updateSelectionIfElementContainerAvailable() {
        self.inner.clear()
    }
    
    open override func clear() {
        self.inner.clear()
    }
}
