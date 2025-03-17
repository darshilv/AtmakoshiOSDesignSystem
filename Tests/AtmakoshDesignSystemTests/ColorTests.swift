//
//  ColorTests.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 3/16/25.
//


import XCTest
@testable import AtmakoshDesignSystem

final class ColorTests: XCTestCase {
    func testColorTokensExist() {
        // Test that color tokens resolve to actual colors
        XCTAssertNotNil(ColorTokens.primary)
        XCTAssertNotNil(ColorTokens.secondary)
        XCTAssertNotNil(ColorTokens.accent)
        // Add tests for other colors
    }
    
    func testConvenienceExtension() {
        // Test that the convenience extension works
        XCTAssertEqual(Color.ds.primary, ColorTokens.primary)
        XCTAssertEqual(Color.ds.secondary, ColorTokens.secondary)
        // Add tests for other colors
    }
}
