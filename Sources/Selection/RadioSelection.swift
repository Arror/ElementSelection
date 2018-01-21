//
//  RadioSelection.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/21.
//

import Foundation

public final class RadioSelection<Container: ElementContainer, RadioSelectionContainer: RadioElementSelectionContainer>: RadioElementSelection where RadioSelectionContainer.Element == Container.Element, Container.Element: Equatable {
    
    public let container: Container
    public private(set) var selectionContainer: RadioSelectionContainer
    
    public required init(container: Container, selectionContainerType: RadioSelectionContainer.Type) {
        self.container = container
        self.selectionContainer = selectionContainerType.init()
    }
    
    public func isSelected(of element: Container.Element) -> Bool {
        return self.selectionContainer.isSelected(of: element)
    }
    
    public func set(selected isSelected: Bool, for element: Container.Element) {
        if isSelected {
            self.selectionContainer.select(element: element)
        } else {
            self.selectionContainer.deselect(element: element)
        }
    }
    
    public func updateSelectionIfElementContainerAvailable() {
        self.selectionContainer.update(by: self.container)
    }
    
    public func clear() {
        self.selectionContainer.clear()
    }
}
