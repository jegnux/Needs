//
//  Need+UIViewController.swift
//  Needs
//
//  Created by Jérôme Alves on 23/12/2020.
//  Copyright © 2020 Needs. All rights reserved.
//

#if os(iOS) || os(tvOS)
import Foundation
import UIKit

extension Need where EnclosingSelf: UIViewController {
    
    #if os(iOS)
    public static var statusBarAppearanceUpdate: Need<EnclosingSelf> {
        Need { $0.setNeedsStatusBarAppearanceUpdate() }
    }

    @available(iOS 11.0, *)
    public static var updateOfHomeIndicatorAutoHidden: Need<EnclosingSelf> {
        Need { $0.setNeedsUpdateOfHomeIndicatorAutoHidden() }
    }
    
    @available(iOS 11.0, *)
    public static var updateOfScreenEdgesDeferringSystemGestures: Need<EnclosingSelf> {
        Need { $0.setNeedsUpdateOfScreenEdgesDeferringSystemGestures() }
    }
    
    @available(iOS 14.0, *)
    public static var updateOfPrefersPointerLocked: Need<EnclosingSelf> {
        Need { $0.setNeedsUpdateOfPrefersPointerLocked() }
    }
    #endif
    
    
    #if os(tvOS)
    @available(tvOS 11.0, *)
    public static var userInterfaceAppearanceUpdate: Need<EnclosingSelf> {
        Need { $0.setNeedsUserInterfaceAppearanceUpdate() }
    }
    #endif
    
    public static var focusUpdate: Need<EnclosingSelf> {
        Need { $0.setNeedsFocusUpdate() }
    }

    // MARK: - View Needs
    
    public static var viewDisplay: Need<EnclosingSelf> {
        Need { $0.viewIfLoaded?.setNeedsDisplay() }
    }
    
    public static var viewLayout: Need<EnclosingSelf> {
        Need { $0.viewIfLoaded?.setNeedsLayout() }
    }
    
    public static var updateViewConstraints: Need<EnclosingSelf> {
        Need { $0.viewIfLoaded?.setNeedsUpdateConstraints() }
    }

}

extension Need where EnclosingSelf: UITableViewController {
    public static var reloadData: Need<EnclosingSelf> {
        Need { $0.tableView.reloadData() }
    }
}
#endif
