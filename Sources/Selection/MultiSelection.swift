//
//  MultiSelection.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/21.
//

import Foundation

public final class MultiSelection<EC: ElementContainer, MSEC: MultiElementSelectionContainer>: AbstractMultiSelection<EC, MSEC> where EC.Element == MSEC.Element, EC.Element: Identifiable, EC.Element.Identifier: Hashable {
    
    private let container: EC
    private var selectionContainer: MSEC
    
    public init(container: EC, selectionContainerType: MSEC.Type) {
        self.container = container
        self.selectionContainer = selectionContainerType.init()
    }
    
    public override var elements: [EC.Element] {
        return self.selectionContainer.elements
    }
    
    public override func isSelected(of element: EC.Element) -> Bool {
        return self.selectionContainer.isSelected(of: element)
    }
    
    public override func set(selected isSelected: Bool, for element: EC.Element) {
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
