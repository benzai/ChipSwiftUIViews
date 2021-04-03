import SwiftUI

// MARK: - AppTheme Builder

struct AppThemeBuilder {
  static func color(color: ColorTint) -> Color {
    let colors = AppTheme.shared.colors
    switch color {
    case .accent1: return colors.accent1
    case .accent2: return colors.accent2
    case .text1: return colors.text1
    case .text2: return colors.text2
    case .text3: return colors.text3
    case .altText1: return colors.altText1
    case .altText2: return colors.altText2
    case .altText3: return colors.altText3
    case .bg1: return colors.bg1
    case .bg2: return colors.bg2
    case .altBg1: return colors.altBg1
    case .altBg2: return colors.altBg2
    case .statusPositive: return colors.statusPositive
    case .statusWarning: return colors.statusWarning
    case .statusNegative: return colors.statusNegative
    case .custom(let custom): return custom
    }
  }

  static func fontWeight(weight: FontWeight) -> String {
    let weights = AppTheme.shared.styles
    switch weight {
    case .regular: return weights.fontWeight_regular
    case .medium: return weights.fontWeight_medium
    case .bold: return weights.fontWeight_bold
    }
  }

  static func fontSize(size: FontSize) -> (size: CGFloat, kerning: CGFloat) {
    let sizes = AppTheme.shared.styles
    switch size {
    case .xl: return sizes.fontSize_xl
    case .lg: return sizes.fontSize_lg
    case .lg2: return sizes.fontSize_lg2
    case .lg3: return sizes.fontSize_lg3
    case .md: return sizes.fontSize_md
    case .md2: return sizes.fontSize_md2
    case .md3: return sizes.fontSize_md3
    case .sm: return sizes.fontSize_sm
    case .sm2: return sizes.fontSize_sm2
    case .sm3: return sizes.fontSize_sm3
    case .xs: return sizes.fontSize_xs
    }
  }
}
