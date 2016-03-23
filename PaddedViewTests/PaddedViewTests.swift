//
//  PaddedViewTests.swift
//  PaddedViewTests
//
//  Created by Ariel Elkin on 15/03/16.
//  Copyright © 2016 Project A Ventures GmbH. All rights reserved.
//

import XCTest

@testable import PaddedView

class PaddedViewTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit() {

        let label = UILabel()
        label.text = "hello"

        let padding = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 10)

        let labelPadded = PaddedView(content: label, padding: padding)

        XCTAssertEqual(labelPadded.contentView, label)
        XCTAssertEqual(labelPadded.padding, padding)

        let newPadding = UIEdgeInsets(top: 30, left: 20, bottom: 50, right: 50)

        labelPadded.padding = newPadding

        XCTAssertEqual(labelPadded.padding, newPadding)
    }
}
