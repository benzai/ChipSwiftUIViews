import SwiftUI

// MARK: - AppTheme Defaults

public struct DefaultThemeColors: AppThemeColors {
  public var accent1: Color { Color("#2B55D9") }
  public var accent2: Color { Color("#2CC7DD") }
  public var text1: Color { Color("#263340") }
  public var text2: Color { Color("#6B8299") }
  public var text3: Color { Color("#99ACBF") }
  public var altText1: Color { Color("#FCFCFC") }
  public var altText2: Color { Color("#FCFCFC") }
  public var altText3: Color { Color("#FCFCFC") }
  public var bg1: Color { Color("#FCFCFC") }
  public var bg2: Color { Color("#E9EBED") }
  public var altBg1: Color { Color("#394566") }
  public var altBg2: Color { Color("#394566") }
  public var statusPositive: Color { Color("#51D191") }
  public var statusWarning: Color { Color("#FF5901") }
  public var statusNegative: Color { Color("#FF5959") }

  public var category1: Color { Color("#4285F4") }
  public var category2: Color { Color("#F4B400") }
  public var category3: Color { Color("#0F9D58") }
}

public struct DefaultThemeStyles: AppThemeStyles {
  // FontWeight
  public var fontWeight_regular: String { R.font.gtWalsheimPro.fontName }
  public var fontWeight_medium: String { R.font.gtWalsheimProMedium.fontName }
  public var fontWeight_bold: String { R.font.gtWalsheimProBold.fontName }

  // FontSize
  public var fontSize_xl: FontSizeKerning { (size: 48, kerning: -1.4) }
  public var fontSize_lg: FontSizeKerning { (size: 40, kerning: -1) }
  public var fontSize_lg2: FontSizeKerning { (size: 32, kerning: -0.7) }
  public var fontSize_lg3: FontSizeKerning { (size: 24, kerning: -0.4) }
  public var fontSize_md: FontSizeKerning { (size: 20, kerning: -0.3) }
  public var fontSize_md2: FontSizeKerning { (size: 18, kerning: -0.3) }
  public var fontSize_md3: FontSizeKerning { (size: 16, kerning: -0.1) }
  public var fontSize_sm: FontSizeKerning { (size: 14, kerning: 0) }
  public var fontSize_sm2: FontSizeKerning { (size: 13, kerning: 0) }
  public var fontSize_sm3: FontSizeKerning { (size: 12, kerning: 0) }
  public var fontSize_xs: FontSizeKerning { (size: 11, kerning: 0) }

  // InputSize
  public var inputSize_xs: CGFloat { 28 }
  public var inputSize_sm: CGFloat { 32 }
  public var inputSize_md: CGFloat { 40 }
  public var inputSize_lg: CGFloat { 48 }
  public var inputSize_xl: CGFloat { 56 }

  // IconSize
  public var iconSize_xs: CGFloat { 16 }
  public var iconSize_sm: CGFloat { 20 }
  public var iconSize_md: CGFloat { 24 }
  public var iconSize_lg: CGFloat { 28 }
  public var iconSize_xl: CGFloat { 32 }

  // Roundness
  public var roundness_sm: CGFloat { 4 }
  public var roundness_md: CGFloat { 8 }
  public var roundness_lg: CGFloat { 12 }
  public var roundness_full: CGFloat { 1000 }
}
