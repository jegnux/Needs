//
//  NeedsTests.swift
//  Needs
//
//  Created by Jérôme Alves on 23/12/2020.
//  Copyright © 2020 Needs. All rights reserved.
//

import Foundation
import XCTest
import Needs

#if canImport(UIKit)

import UIKit

final class View: UIView {
    
    @Needs(.layout, .display)
    var progress: CGFloat = 0
    
    var setNeedsDisplayCount: Int = 0
    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        setNeedsDisplayCount += 1
    }
}

#elseif canImport(AppKit)

final class View: NSView {
    
    @Needs(.layout, .display)
    var progress: CGFloat = 0
    
    var setNeedsDisplayCount: Int = 0
    
    override func setNeedsDisplay(_ rect: CGRect) {
        super.setNeedsDisplay(rect)
        setNeedsDisplayCount += 1
    }
}

#endif

class NeedsTests: XCTestCase {
    func testNeeds() {
        let sut = View()
        XCTAssertEqual(sut.setNeedsDisplayCount, 0)

        sut.progress = 0.5
        XCTAssertEqual(sut.setNeedsDisplayCount, 1)

        sut.progress = 0.5
        XCTAssertEqual(sut.setNeedsDisplayCount, 1)
        
        sut.progress = 1
        XCTAssertEqual(sut.setNeedsDisplayCount, 2)
    }
    
    static var allTests = [
        ("testNeeds", testNeeds),
    ]
}
