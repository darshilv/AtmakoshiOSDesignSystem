//
//  ColorTests.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 3/16/25.
//


import XCTest
import SwiftUI
@testable import AtmakoshDesignSystem

final class ColorTests: XCTestCase {
    func testColorTokensExist() {
        // Test that color tokens resolve to actual colors
        XCTAssertNotNil(ColorTokens.Semantic.primary)
        XCTAssertNotNil(ColorTokens.Semantic.secondary)
        XCTAssertNotNil(ColorTokens.Semantic.tertiary)
        // Add tests for other colors
    }

    func testConvenienceExtension() {
        // Test that the convenience extension accessors are reachable
        XCTAssertNotNil(Color.ds.primary)
        XCTAssertNotNil(Color.ds.secondary)
        // Add tests for other colors
    }
}
