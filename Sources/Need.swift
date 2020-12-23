//
//  Need.swift
//  Needs
//
//  Created by Jérôme Alves on 23/12/2020.
//  Copyright © 2020 Needs. All rights reserved.
//

import Foundation

public struct Need<EnclosingSelf> {
    private let handler: (EnclosingSelf) -> Void
    
    public init(handler: @escaping (EnclosingSelf) -> Void) {
        self.handler = handler
    }
    
    public func callAsFunction(on enclosingSelf: EnclosingSelf) {
        handler(enclosingSelf)
    }
}

extension Need: ExpressibleByArrayLiteral {
    
    public static func union(_ needs: [Need<EnclosingSelf>]) -> Need<EnclosingSelf> {
        Need { enclosingSelf in
            for need in needs {
                need.handler(enclosingSelf)
            }
        }
    }
    
    public init(arrayLiteral elements: Need<EnclosingSelf>...) {
        self = .union(elements)
    }

}
