//
//  Need+UIView.swift
//  Needs
//
//  Created by Jérôme Alves on 23/12/2020.
//  Copyright © 2020 Needs. All rights reserved.
//

#if os(iOS) || os(tvOS)
import Foundation
import UIKit

extension Need where EnclosingSelf: UIView {
    public static var display: Need<EnclosingSelf> {
        Need { $0.setNeedsDisplay() }
    }
    
    public static var layout: Need<EnclosingSelf> {
        Need { $0.setNeedsLayout() }
    }
    
    public static var updateConstraints: Need<EnclosingSelf> {
        Need { $0.setNeedsUpdateConstraints() }
    }
    
    public static var focusUpdate: Need<EnclosingSelf> {
        Need { $0.setNeedsFocusUpdate() }
    }
}

#endif
