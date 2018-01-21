//
//  AbstractSelection.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/21.
//

import Foundation

open class AbstractSelection<Container: ElementContainer> {
    
    open let container: Container
    
    public init (container: Container) {
        self.container = container
    }
    
    open func isSelected(of element: Container.Element) -> Bool {
        fatalError("Not implement.")
    }
    
    open func set(selected isSelected: Bool, for element: Container.Element) {
        fatalError("Not implement.")
    }
    
    open func updateSelectionIfElementContainerAvailable() {
        fatalError("Not implement.")
    }
    
    open func clear() {
        fatalError("Not implement.")
    }
}
