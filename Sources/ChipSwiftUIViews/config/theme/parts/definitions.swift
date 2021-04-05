import SwiftUI

// MARK: - AppTheme Definitions

public protocol AppThemeColors {
  var accent1: Color { get }
  var accent2: Color { get }
  
  var text1: Color { get }
  var text2: Color { get }
  var text3: Color { get }
  var altText1: Color { get }
  var altText2: Color { get }
  var altText3: Color { get }
  
  var bg1: Color { get }
  var bg2: Color { get }
  var altBg1: Color { get }
  var altBg2: Color { get }
  
  var statusPositive: Color { get }
  var statusWarning: Color { get }
  var statusNegative: Color { get }
  
  var category1: Color { get }
  var category2: Color { get }
  var category3: Color { get }
}

public protocol AppThemeStyles {
  typealias FontSizeKerning = (size: CGFloat, kerning: CGFloat)

  // FontWeight
  var fontWeight_regular: String { get }
  var fontWeight_medium: String { get }
  var fontWeight_bold: String { get }

  // FontSize
  var fontSize_xl: FontSizeKerning { get }
  var fontSize_lg: FontSizeKerning { get }
  var fontSize_lg2: FontSizeKerning { get }
  var fontSize_lg3: FontSizeKerning { get }
  var fontSize_md: FontSizeKerning { get }
  var fontSize_md2: FontSizeKerning { get }
  var fontSize_md3: FontSizeKerning { get }
  var fontSize_sm: FontSizeKerning { get }
  var fontSize_sm2: FontSizeKerning { get }
  var fontSize_sm3: FontSizeKerning { get }
  var fontSize_xs: FontSizeKerning { get }

  // InputSize
  var inputSize_xs: CGFloat { get }
  var inputSize_sm: CGFloat { get }
  var inputSize_md: CGFloat { get }
  var inputSize_lg: CGFloat { get }
  var inputSize_xl: CGFloat { get }

  // IconSize
  var iconSize_xs: CGFloat { get }
  var iconSize_sm: CGFloat { get }
  var iconSize_md: CGFloat { get }
  var iconSize_lg: CGFloat { get }
  var iconSize_xl: CGFloat { get }

  // Roundness
  var roundness_sm: CGFloat { get }
  var roundness_md: CGFloat { get }
  var roundness_lg: CGFloat { get }
  var roundness_full: CGFloat { get }
}
