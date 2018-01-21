//
//  RadioSelection.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/21.
//

import Foundation

public final class RadioSelection<Container: ElementContainer, RadioSelectionContainer: RadioElementSelectionContainer>: AbstractSelection<Container>, RadioElementSelection where RadioSelectionContainer.Element == Container.Element, Container.Element: Identifiable, Container.Element.Identifier: Equatable {
    
    public private(set) var selectionContainer: RadioSelectionContainer
    
    public required init(container: Container, selectionContainerType: RadioSelectionContainer.Type) {
        self.selectionContainer = selectionContainerType.init()
        super.init(container: container)
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
