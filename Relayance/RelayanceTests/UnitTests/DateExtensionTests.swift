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
    
    // MARK: - getDay()
    
    func test_GivenSpecificDate_WhenGettingDay_ThenReturnsCorrectDay() {
        // Given
        let date = makeDate(year: 2025, month: 7, day: 15)
        
        // When
        let day = date.getDay()
        
        // Then
        XCTAssertEqual(day, 15)
    }
    
    func test_GivenCurrentDate_WhenGettingDay_ThenReturnsCurrentDay() {
        // Given
        let currentDate = Date()
        
        // When
        let day = currentDate.getDay()
        
        // Then
        XCTAssertEqual(day, Calendar.current.component(.day, from: currentDate))
    }
    
    // MARK: - getMonth()
    
    func test_GivenSpecificDate_WhenGettingMonth_ThenReturnsCorrectMonth() {
        // Given
        let date = makeDate(year: 2025, month: 12, day: 1)
        
        // When
        let month = date.getMonth()
        
        // Then
        XCTAssertEqual(month, 12)
    }
    
    func test_GivenCurrentDate_WhenGettingMonth_ThenReturnsCurrentMonth() {
        // Given
        let currentDate = Date()
        
        // When
        let month = currentDate.getMonth()
        
        // Then
        XCTAssertEqual(month, Calendar.current.component(.month, from: currentDate))
    }
    
    // MARK: - getYear()
    
    func test_GivenSpecificDate_WhenGettingYear_ThenReturnsCorrectYear() {
        // Given
        let date = makeDate(year: 2023, month: 1, day: 1)
        
        // When
        let year = date.getYear()
        
        // Then
        XCTAssertEqual(year, 2023)
    }
    
    func test_GivenCurrentDate_WhenGettingYear_ThenReturnsCurrentYear() {
        // Given
        let currentDate = Date()
        
        // When
        let year = currentDate.getYear()
        
        // Then
        XCTAssertEqual(year, Calendar.current.component(.year, from: currentDate))
    }
}
