//
//  StoreWGTests.swift
//  StoreWGTests
//
//  Created by Jorge Luis Rivera Ladino on 28/04/20.
//  Copyright © 2020 Jorge Luis Rivera Ladino. All rights reserved.
//

import XCTest
@testable import StoreWG

class StoreWGTests: XCTestCase {

    func testCounterModel() {
        let counter = Counter(id: "id00", title: "Leche", count: 5)
        XCTAssertEqual(counter.count, 5, "Model it's work")
    }

}
