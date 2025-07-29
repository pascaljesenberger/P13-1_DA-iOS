//
//  DateExtensionTests.swift
//  RelayanceTests
//
//  Created by Pascal Jesenberger on 26/07/2025.
//

import XCTest
@testable import Relayance

final class DateExtensionTests: XCTestCase {
    
    // MARK: - Helpers
    
    private func makeDate(year: Int, month: Int, day: Int) -> Date {
        let calendar = Calendar.current
        let dateComponents = DateComponents(year: year, month: month, day: day)
        return calendar.date(from: dateComponents)!
    }
    
    // MARK: - dateFromString(_:)
    
    func test_GivenValidISOString_WhenConvertingToDate_ThenReturnsDate() {
        // Given
        let validISOString = "2025-07-24"
        
        // When
        let date = Date.dateFromString(validISOString)
        
        // Then
        XCTAssertNotNil(date)
        XCTAssertEqual(Calendar.current.component(.year, from: date!), 2025)
        XCTAssertEqual(Calendar.current.component(.month, from: date!), 7)
        XCTAssertEqual(Calendar.current.component(.day, from: date!), 24)
    }
    
    func test_GivenInvalidString_WhenConvertingToDate_ThenReturnsNil() {
        // Given
        let invalidString = "invalid-date-format"
        
        // When
        let date = Date.dateFromString(invalidString)
        
        // Then
        XCTAssertNil(date)
    }
    
    // MARK: - stringFromDate(_:)
    
    func test_GivenValidDate_WhenConvertingToString_ThenReturnsFormattedString() {
        // Given
        let date = makeDate(year: 2025, month: 7, day: 24)
        
        // When
        let dateString = Date.stringFromDate(date)
        
        // Then
        XCTAssertNotNil(dateString)
        XCTAssertEqual(dateString, "24-07-2025")
    }
    
    func test_GivenCurrentDate_WhenConvertingToString_ThenReturnsFormattedCurrentDate() {
        // Given
        let currentDate = Date()
        
        // When
        let dateString = Date.stringFromDate(currentDate)
        
        // Then
        XCTAssertNotNil(dateString)
        XCTAssertEqual(dateString, String(format: "%02d-%02d-%d",
                                          Calendar.current.component(.day, from: currentDate),
                                          Calendar.current.component(.month, from: currentDate),
                                          Calendar.current.component(.year, from: currentDate)))
    }
}
