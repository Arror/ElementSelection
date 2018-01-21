//
//  Identifiable.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/20.
//  Copyright © 2018年 Arror. All rights reserved.
//

import Foundation

public protocol Identifiable {
    
    associatedtype Identifier
    
    var identifier: Identifier { get }
}

extension Identifiable where Self: Equatable, Identifier: Equatable {
    
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

extension Identifiable where Self: Hashable, Identifier: Hashable {
    
    public var hashValue: Int {
        return self.identifier.hashValue
    }
}

extension Identifiable where Self: Comparable, Identifier: Comparable {
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.identifier < rhs.identifier
    }
}

extension Collection where Iterator.Element: Identifiable, Iterator.Element.Identifier: Hashable {
    
    public var idMapping: [Iterator.Element.Identifier: Iterator.Element] {
        var mapping: [Iterator.Element.Identifier: Iterator.Element] = [:]
        self.forEach { mapping[$0.identifier] = $0 }
        return mapping
    }
}
