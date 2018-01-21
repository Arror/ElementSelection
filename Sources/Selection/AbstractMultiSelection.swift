//
//  AbstractMultiSelection.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/21.
//

import Foundation

open class AbstractMultiSelection<Container: ElementContainer, MultiSelectionContainer: MultiElementSelectionContainer>: MultiElementSelection where MultiSelectionContainer.Element == Container.Element, Container.Element: Identifiable, Container.Element.Identifier: Equatable {
    
    public let container: Container
    public internal(set) var selectionContainer: MultiSelectionContainer
    
    public required init(container: Container, selectionContainerType: MultiSelectionContainer.Type) {
        self.container = container
        self.selectionContainer = selectionContainerType.init()
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
