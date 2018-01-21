//
//  RadioSelection.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/21.
//

import Foundation

public final class RadioSelection<EC: ElementContainer, RSEC: RadioElementSelectionContainer>: RadioElementSelection where EC.Element == RSEC.Element, EC.Element: Equatable {
    
    public typealias Container = EC
    public typealias RadioSelectionContainer = RSEC
    
    internal let container: EC
    internal var selectionContainer: RSEC
    
    public required init(container: EC, selectionContainerType: RSEC.Type) {
        self.container = container
        self.selectionContainer = selectionContainerType.init()
    }
    
    public var element: EC.Element? {
        return self.selectionContainer.element
    }
    
    public func isSelected(of element: EC.Element) -> Bool {
        return self.selectionContainer.isSelected(of: element)
    }
    
    public func set(selected isSelected: Bool, for element: EC.Element) {
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
