//
//  Need+NSView.swift
//  Needs
//
//  Created by Jérôme Alves on 23/12/2020.
//  Copyright © 2020 Needs. All rights reserved.
//

#if os(macOS)
import Foundation
import AppKit

extension Need where EnclosingSelf: NSView {
    public static var display: Need<EnclosingSelf> {
        Need { $0.setNeedsDisplay($0.bounds) }
    }
    
    public static var layout: Need<EnclosingSelf> {
        Need { $0.needsLayout = true }
    }
    
    public static var updateConstraints: Need<EnclosingSelf> {
        Need { $0.needsUpdateConstraints = true }
    }
}
#endif

