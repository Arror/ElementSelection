//
//  MultiSelection.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/21.
//

import Foundation

public final class MultiSelection<Container: ElementContainer, MultiSelectionContainer: MultiElementSelectionContainer>: AbstractMultiSelection<Container, MultiSelectionContainer> where MultiSelectionContainer.Element == Container.Element, Container.Element: Identifiable, Container.Element.Identifier: Equatable {
    
    public required init(container: Container, selectionContainerType: MultiSelectionContainer.Type) {
        super.init(container: container, selectionContainerType: selectionContainerType)
    }
    
    public override func isSelected(of element: Container.Element) -> Bool {
        return self.selectionContainer.isSelected(of: element)
    }
    
    public override func set(selected isSelected: Bool, for element: Container.Element) {
        if isSelected {
            self.selectionContainer.select(element: element)
        } else {
            self.selectionContainer.deselect(element: element)
        }
    }
    
    public override func updateSelectionIfElementContainerAvailable() {
        self.selectionContainer.update(by: self.container)
    }
    
    public override func clear() {
        self.selectionContainer.clear()
    }
}
