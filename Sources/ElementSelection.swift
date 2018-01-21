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
    
    var container: Container { get }
    
    func isSelected(of element: Container.Element) -> Bool
    
    func set(selected isSelected: Bool, for element: Container.Element)
    
    func updateSelectionIfElementContainerAvailable()
}

public protocol RadioElementSelection: ElementSelection {
    
    associatedtype SelectionContainer: RadioElementSelectionContainer where SelectionContainer.Element == Container.Element
    
    var selectionContainer: SelectionContainer { get }
    
    init(container: Container, selectionContainerType: SelectionContainer.Type)
}

public protocol MultiElementSelection: ElementSelection {
    
    associatedtype SelectionContainer: MultiElementSelectionContainer where SelectionContainer.Element == Container.Element
    
    var selectionContainer: SelectionContainer { get }
    
    init(container: Container, selectionContainerType: SelectionContainer.Type)
}

extension ElementSelection {
    
    public func makeSelectionItem(for element: Container.Element) -> SelectionItem<Self> {
        return SelectionItem(selection: self, element: element)
    }
}
