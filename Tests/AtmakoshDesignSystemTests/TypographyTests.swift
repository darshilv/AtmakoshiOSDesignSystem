//
//  TypographyTests.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 3/16/25.
//


import XCTest
@testable import YourDesignSystem

final class TypographyTests: XCTestCase {
    func testFontSizes() {
        // Test that font sizes match expectations
        XCTAssertEqual(TypographyTokens.Size.xs, 12)
        XCTAssertEqual(TypographyTokens.Size.md, 16)
        XCTAssertEqual(TypographyTokens.Size.xxxl, 32)
        // Add tests for other sizes
    }
    
    func testFontStyles() {
        // These tests are basic since we can't easily test Font equality
        XCTAssertNotNil(TypographyTokens.heading1())
        XCTAssertNotNil(TypographyTokens.body())
        // Add tests for other styles
    }
}