//
//  ElementSelectionContainer.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/2.
//  Copyright © 2018年 Arror. All rights reserved.
//

import Foundation

public protocol ElementSelectionContainer {
    
    associatedtype Element
    
    init()
    
    var elementCount: Int { get }
    
    mutating func select(element: Element)
    
    mutating func deselect(element: Element)
    
    func isSelected(of element: Element) -> Bool
    
    mutating func clear()
    
    mutating func update<Container>(by elementContainer: Container) where Container: ElementContainer, Container.Element == Element
}

public protocol RadioElementSelectionContainer: ElementSelectionContainer {
    
    var element: Element? { get }
}

public protocol MultiElementSelectionContainer: ElementSelectionContainer {
    
    var elements: [Element] { get }
}
