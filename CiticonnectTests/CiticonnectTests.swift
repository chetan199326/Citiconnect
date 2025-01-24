//
//  CiticonnectTests.swift
//  CiticonnectTests
//
//  Created by Apple on 24/01/25.
//

import XCTest
@testable import Citiconnect

class CiticonnectTests: XCTestCase {
    
    var viewModel: CitiesViewModel!

    override func setUp() {
        super.setUp()
        viewModel = CitiesViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testGroupCitiesByState() {
        viewModel.fetchCitiesData()
        
        XCTAssertTrue(viewModel.citiesByState.keys.contains("New South Wales"))
        XCTAssertTrue(viewModel.citiesByState.keys.contains("Victoria"))
    }
    
    func testReverseCitiesOrder() {
        viewModel.fetchCitiesData()

        let initialState = viewModel.citiesByState
        viewModel.reverseCitiesOrder()
        
        // CHeck that cities order is reversed
        XCTAssertNotEqual(initialState, viewModel.citiesByState)
    }
    
}
    

   
