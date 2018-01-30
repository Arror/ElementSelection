//
//  AbstractMultiSelection.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/21.
//

import Foundation

open class AbstractMultiSelection<EC: ElementContainer, MSEC: MultiElementSelectionContainer>: MultiElementSelection where EC.Element == MSEC.Element {
    
    public typealias Container = EC
    public typealias MultiSelectionContainer = MSEC
    
    public var elements: [EC.Element] {
        fatalError("Not implement.")
    }
    
    open func isSelected(of element: EC.Element) -> Bool {
        fatalError("Not implement.")
    }
    
    open func set(selected isSelected: Bool, for element: EC.Element) {
        fatalError("Not implement.")
    }
    
    open func updateSelectionIfElementContainerAvailable() {
        fatalError("Not implement.")
    }
    
    open func clear() {
        fatalError("Not implement.")
    }
}
