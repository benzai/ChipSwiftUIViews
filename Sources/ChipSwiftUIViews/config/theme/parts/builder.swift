import SwiftUI

// MARK: - AppTheme Builder

public struct AppThemeBuilder {
  public static func color(context: AppTheme, color: ColorTint) -> Color {
    let colors = context.colors
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

  public static func fontWeight(context: AppTheme, weight: FontWeight) -> String {
    let weights = context.styles
    switch weight {
    case .regular: return weights.fontWeight_regular
    case .medium: return weights.fontWeight_medium
    case .bold: return weights.fontWeight_bold
    }
  }

  public static func fontSize(context: AppTheme,
                              size: FontSize) -> (size: CGFloat, kerning: CGFloat)
  {
    let sizes = context.styles
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

  public static func inputSize(context: AppTheme,
                               size: InputSize) -> CGFloat
  {
    let sizes = context.styles
    switch size {
    case .xs: return sizes.inputSize_xs
    case .sm: return sizes.inputSize_sm
    case .md: return sizes.inputSize_md
    case .lg: return sizes.inputSize_lg
    case .xl: return sizes.inputSize_xl
    }
  }

  public static func iconSize(context: AppTheme,
                              size: IconSize) -> CGFloat
  {
    let sizes = context.styles
    switch size {
    case .xs: return sizes.iconSize_xs
    case .sm: return sizes.iconSize_sm
    case .md: return sizes.iconSize_md
    case .lg: return sizes.iconSize_lg
    case .xl: return sizes.iconSize_xl
    }
  }

  public static func roundness(context: AppTheme,
                               size: Roundness) -> CGFloat
  {
    let sizes = context.styles
    switch size {
    case .sm: return sizes.roundness_sm
    case .md: return sizes.roundness_md
    case .lg: return sizes.roundness_lg
    case .full: return sizes.roundness_full
    }
  }
}
