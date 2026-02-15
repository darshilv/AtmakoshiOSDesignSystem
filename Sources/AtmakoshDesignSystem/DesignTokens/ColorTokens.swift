//
//  ColorTokens.swift
//  AtmakoshDesignSystem
//
//  Created by Darshil Vora on 3/14/25.
//


import SwiftUI

@available(macOS 10.15, *)
// Tailwind-inspired color system
public enum ColorTokens {
    // MARK: - Slate
    public enum Slate {
        public static let slate50 = Color(hex: "f8fafc")
        public static let slate100 = Color(hex: "f1f5f9")
        public static let slate200 = Color(hex: "e2e8f0")
        public static let slate300 = Color(hex: "cbd5e1")
        public static let slate400 = Color(hex: "94a3b8")
        public static let slate500 = Color(hex: "64748b")
        public static let slate600 = Color(hex: "475569")
        public static let slate700 = Color(hex: "334155")
        public static let slate800 = Color(hex: "1e293b")
        public static let slate900 = Color(hex: "0f172a")
        public static let slate950 = Color(hex: "020617")
    
    }
    
    // MARK: - Gray
    public enum Gray {
        public static let gray50 = Color(hex: "f9fafb")
        public static let gray100 = Color(hex: "f3f4f6")
        public static let gray200 = Color(hex: "e5e7eb")
        public static let gray300 = Color(hex: "d1d5db")
        public static let gray400 = Color(hex: "9ca3af")
        public static let gray500 = Color(hex: "6b7280")
        public static let gray600 = Color(hex: "4b5563")
        public static let gray700 = Color(hex: "374151")
        public static let gray800 = Color(hex: "1f2937")
        public static let gray900 = Color(hex: "111827")
        public static let gray950 = Color(hex: "030712")
    }
    
    // MARK: - Zinc
    public enum Zinc {
        public static let zinc50 = Color(hex: "fafafa")
        public static let zinc100 = Color(hex: "f4f4f5")
        public static let zinc200 = Color(hex: "e4e4e7")
        public static let zinc300 = Color(hex: "d4d4d8")
        public static let zinc400 = Color(hex: "a1a1aa")
        public static let zinc500 = Color(hex: "71717a")
        public static let zinc600 = Color(hex: "52525b")
        public static let zinc700 = Color(hex: "3f3f46")
        public static let zinc800 = Color(hex: "27272a")
        public static let zinc900 = Color(hex: "18181b")
        public static let zinc950 = Color(hex: "09090b")
    }
    
    // MARK: - Blue
    public enum Blue {
        public static let blue50 = Color(hex: "eff6ff")
        public static let blue100 = Color(hex: "dbeafe")
        public static let blue200 = Color(hex: "bfdbfe")
        public static let blue300 = Color(hex: "93c5fd")
        public static let blue400 = Color(hex: "60a5fa")
        public static let blue500 = Color(hex: "3b82f6")
        public static let blue600 = Color(hex: "2563eb")
        public static let blue700 = Color(hex: "1d4ed8")
        public static let blue800 = Color(hex: "1e40af")
        public static let blue900 = Color(hex: "1e3a8a")
        public static let blue950 = Color(hex: "172554")
    }
    
    // MARK: - Green
    public enum Green {
        public static let green50 = Color(hex: "f0fdf4")
        public static let green100 = Color(hex: "dcfce7")
        public static let green200 = Color(hex: "bbf7d0")
        public static let green300 = Color(hex: "86efac")
        public static let green400 = Color(hex: "4ade80")
        public static let green500 = Color(hex: "22c55e")
        public static let green600 = Color(hex: "16a34a")
        public static let green700 = Color(hex: "15803d")
        public static let green800 = Color(hex: "166534")
        public static let green900 = Color(hex: "14532d")
        public static let green950 = Color(hex: "052e16")
    }
    
    // MARK: - Red
    public enum Red {
        public static let red50 = Color(hex: "fef2f2")
        public static let red100 = Color(hex: "fee2e2")
        public static let red200 = Color(hex: "fecaca")
        public static let red300 = Color(hex: "fca5a5")
        public static let red400 = Color(hex: "f87171")
        public static let red500 = Color(hex: "ef4444")
        public static let red600 = Color(hex: "dc2626")
        public static let red700 = Color(hex: "b91c1c")
        public static let red800 = Color(hex: "991b1b")
        public static let red900 = Color(hex: "7f1d1d")
        public static let red950 = Color(hex: "450a0a")
    }
    
    // MARK: - Yellow
    public enum Yellow {
        public static let yellow50 = Color(hex: "fefce8")
        public static let yellow100 = Color(hex: "fef9c3")
        public static let yellow200 = Color(hex: "fef08a")
        public static let yellow300 = Color(hex: "fde047")
        public static let yellow400 = Color(hex: "facc15")
        public static let yellow500 = Color(hex: "eab308")
        public static let yellow600 = Color(hex: "ca8a04")
        public static let yellow700 = Color(hex: "a16207")
        public static let yellow800 = Color(hex: "854d0e")
        public static let yellow900 = Color(hex: "713f12")
        public static let yellow950 = Color(hex: "422006")
    }
    
    // MARK: - Purple
    public enum Purple {
        public static let purple50 = Color(hex: "faf5ff")
        public static let purple100 = Color(hex: "f3e8ff")
        public static let purple200 = Color(hex: "e9d5ff")
        public static let purple300 = Color(hex: "d8b4fe")
        public static let purple400 = Color(hex: "c084fc")
        public static let purple500 = Color(hex: "a855f7")
        public static let purple600 = Color(hex: "9333ea")
        public static let purple700 = Color(hex: "7e22ce")
        public static let purple800 = Color(hex: "6b21a8")
        public static let purple900 = Color(hex: "581c87")
        public static let purple950 = Color(hex: "3b0764")
    }
    
    // MARK: - Indigo
    public enum Teal{
        public static let teal50 = Color(hex: "#D7EEEB")
        public static let teal100 = Color(hex: "#91B0B2")
        public static let teal200 = Color(hex: "#467275")
        public static let teal300 = Color(hex: "#5eead4")
        public static let teal400 = Color(hex: "#2dd4bf")
        public static let teal500 = Color(hex: "#14b8a6")
        //public static let teal600 = Color(hex: "#5E7A6F")
        public static let teal600 = Color(hex: "#84A59D")
        public static let teal700 = Color(hex: "#0f766e")
        public static let teal800 = Color(hex: "#115e59")
        public static let teal900 = Color(hex: "#134e4a")
        public static let teal950 = Color(hex: "#042f2e")
    }
    
    // MARK: - Indigo
    public enum Indigo{
        public static let indigo50 = Color(hex: "#eef2ff")
        public static let indigo100 = Color(hex: "#e0e7ff")
        public static let indigo200 = Color(hex: "#c7d2fe")
        public static let indigo300 = Color(hex: "#a5b4fc")
        public static let indigo400 = Color(hex: "#818cf8")
        public static let indigo500 = Color(hex: "#6366f1")
        public static let indigo600 = Color(hex: "#4f46e5")
        public static let indigo700 = Color(hex: "#4338ca")
        public static let indigo800 = Color(hex: "#3730a3")
        public static let indigo900 = Color(hex: "#312e81")
        public static let indigo950 = Color(hex: "#1e1b4b")
    }
    
    // MARK: - Pink
    public enum Pink{
        public static let pink50 = Color(hex: "#fdf2f8")
        public static let pink100 = Color(hex: "#fce7f3")
        public static let pink200 = Color(hex: "#fbcfe8")
        public static let pink300 = Color(hex: "#f9a8d4")
        public static let pink400 = Color(hex: "#f472b6")
        public static let pink500 = Color(hex: "#ec4899")
        public static let pink600 = Color(hex: "#db2777")
        public static let pink700 = Color(hex: "#be185d")
        public static let pink800 = Color(hex: "#9d174d")
        public static let pink900 = Color(hex: "#831843")
        public static let pink950 = Color(hex: "#500724")
    }
    
    // MARK: - Semantic Colors (Adaptive for Light/Dark Mode)
    public enum Semantic {
        // Base text colors - adaptive
        public static var textPrimary: Color {
            .adaptive(
                light: Teal.teal900,    // Dark text on light background
                dark: Gray.gray50       // Light text on dark background
            )
        }

        public static var textSecondary: Color {
            .adaptive(
                light: Teal.teal600,    // Medium-dark text on light background
                dark: Gray.gray300      // Medium-light text on dark background
            )
        }

        public static var textTertiary: Color {
            .adaptive(
                light: Teal.teal400,    // Light text on light background
                dark: Gray.gray500      // Dim text on dark background
            )
        }

        // Background colors - adaptive
        public static var backgroundPrimary: Color {
            .adaptive(
                light: Gray.gray50,     // Light background
                dark: Gray.gray900      // Dark background
            )
        }

        public static var backgroundSecondary: Color {
            .adaptive(
                light: Gray.gray100,    // Slightly darker light background
                dark: Gray.gray800      // Slightly lighter dark background
            )
        }

        public static var backgroundTertiary: Color {
            .adaptive(
                light: Gray.gray200,    // Even darker light background
                dark: Gray.gray700      // Even lighter dark background
            )
        }

        // Status colors - adaptive (brightened for dark mode)
        public static var success: Color {
            .adaptive(
                light: Green.green600,  // Standard green for light mode
                dark: Green.green400    // Brighter green for dark mode - 7.8:1 contrast
            )
        }

        public static var warning: Color {
            .adaptive(
                light: Yellow.yellow500,    // Standard yellow for light mode
                dark: Yellow.yellow400      // Brighter yellow for dark mode - 13.5:1 contrast
            )
        }

        public static var error: Color {
            .adaptive(
                light: Red.red600,      // Standard red for light mode
                dark: Red.red400        // Brighter red for dark mode - 7.9:1 contrast
            )
        }

        public static var info: Color {
            .adaptive(
                light: Blue.blue500,    // Standard blue for light mode
                dark: Blue.blue400      // Brighter blue for dark mode - 7.2:1 contrast
            )
        }

        // Action colors - adaptive (high contrast for dark mode)
        public static var primary: Color {
            .adaptive(
                light: Teal.teal900,    // Dark teal for light mode
                dark: Teal.teal400      // Bright teal for dark mode - 8.52:1 contrast
            )
        }

        public static var secondary: Color {
            .adaptive(
                light: Purple.purple600,    // Standard purple for light mode
                dark: Purple.purple400      // Brighter purple for dark mode
            )
        }

        public static var tertiary: Color {
            .adaptive(
                light: Gray.gray600,    // Darker gray for light mode
                dark: Gray.gray400      // Lighter gray for dark mode
            )
        }

        // Border colors - adaptive
        public static var borderMedium: Color {
            .adaptive(
                light: Color(hex: "EBEBEB"),    // Light border for light mode
                dark: Gray.gray700              // Darker border for dark mode
            )
        }

        // Grabber - adaptive
        public static var grabber: Color {
            .adaptive(
                light: Slate.slate500,  // Standard grabber for light mode
                dark: Slate.slate400    // Lighter grabber for dark mode
            )
        }
    }
}
