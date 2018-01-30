//
//  LimitMultiSelection.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/21.
//

import Foundation

public final class LimitMultiSelection<MES: MultiElementSelection>: MultiSelectionBox<MES> where MES.Container.Element: Hashable {
    
    public let limit: Int
    
    public init(inner: MES, limit: Int) {
        self.limit = limit
        super.init(inner: inner)
    }
    
    public var isFull: Bool {
        return self.elements.count == self.limit
    }
    
    public override func set(selected isSelected: Bool, for element: MES.Container.Element) {
        if isSelected {
            if self.inner.elements.count < self.limit {
                super.set(selected: isSelected, for: element)
            }
        } else {
            super.set(selected: isSelected, for: element)
        }
    }
}
