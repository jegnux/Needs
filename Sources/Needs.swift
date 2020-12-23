//
//  Needs.swift
//  Needs
//
//  Created by Jérôme Alves on 23/12/2020.
//  Copyright © 2020 Needs. All rights reserved.
//

import Foundation

@propertyWrapper
public struct Needs<EnclosingSelf: AnyObject, T> where T: Equatable {
    
    public var wrappedValue: T
    
    public let need: Need<EnclosingSelf>
    
    public init(wrappedValue: T, _ needs: Need<EnclosingSelf>...) {
        self.wrappedValue = wrappedValue
        self.need = .union(needs)
    }
    
    public static subscript<_EnclosingSelf: AnyObject>(
        _enclosingInstance observed: _EnclosingSelf,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<_EnclosingSelf, T>,
        storage storageKeyPath: ReferenceWritableKeyPath<_EnclosingSelf, Self>
    ) -> T {
        get {
            observed[keyPath: storageKeyPath].wrappedValue
        }
        set {
            let oldValue = observed[keyPath: storageKeyPath].wrappedValue
           
            guard newValue != oldValue else {
                return
            }
            
            observed[keyPath: storageKeyPath].wrappedValue = newValue
            
            guard let enclosingSelf = observed as? EnclosingSelf else {
                // Workaround because EnclosingSelf type inference doesn't work yet
                assertionFailure("Enclosing types mismatch. \(_EnclosingSelf.self) must inherit \(EnclosingSelf.self)")
                return
            }
            
            observed[keyPath: storageKeyPath].need(on: enclosingSelf)
        }
    }
}
