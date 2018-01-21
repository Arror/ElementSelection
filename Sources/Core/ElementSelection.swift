//
//  ElementSelection.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/2.
//  Copyright © 2018年 Arror. All rights reserved.
//

import Foundation

public protocol ElementSelection: class {
    
    associatedtype Container: ElementContainer
    
    func isSelected(of element: Container.Element) -> Bool
    
    func set(selected isSelected: Bool, for element: Container.Element)
    
    func updateSelectionIfElementContainerAvailable()
    
    func clear()
}

public protocol RadioElementSelection: ElementSelection {
    
    associatedtype RadioSelectionContainer: RadioElementSelectionContainer where RadioSelectionContainer.Element == Container.Element
    
    var element: Container.Element? { get }
}

public protocol MultiElementSelection: ElementSelection {
    
    associatedtype MultiSelectionContainer: MultiElementSelectionContainer where MultiSelectionContainer.Element == Container.Element
    
    var elements: [Container.Element] { get }
}

extension ElementSelection {
    
    public func makeSelectionItem(for element: Container.Element) -> SelectionItem<Self> {
        return SelectionItem(selection: self, element: element)
    }
}
