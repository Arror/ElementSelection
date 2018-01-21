//
//  ElementContainer.swift
//  ElementSelection
//
//  Created by Arror on 2018/1/2.
//  Copyright © 2018年 Arror. All rights reserved.
//

import Foundation

public protocol ElementContainer: class {
    
    associatedtype Element
    
    var elements: [Element] { get }
}
