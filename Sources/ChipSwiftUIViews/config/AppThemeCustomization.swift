import SwiftUI

public typealias ColorTint = AppThemeConfig.ColorTint
public typealias FontWeight = AppThemeConfig.FontWeight
public typealias FontSize = AppThemeConfig.FontSize
public typealias InputSize = AppThemeConfig.InputSize
public typealias Roundness = AppThemeConfig.Roundness
public typealias IconSize = AppThemeConfig.IconSize

/**
 Copy this extension, AppFontModifier and the appFont
 extensions to your app to customize the theme.
 Rename the extension to the theme class of your app.
 */
public struct AppThemeConfig {
  /// ColorTint
  public enum ColorTint {
    case accent1
    case accent2
    case text1
    case text2
    case text3
    case altText1
    case altText2
    case altText3
    case bg1
    case bg2
    case altBg1
    case altBg2
    case statusPositive
    case statusWarning
    case statusNegative
    case custom(Color)

    public var color: Color {
      let colors = DefaultTheme()
      switch self {
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

    public var uiColor: UIColor {
      color.uiColor()
    }
  }

  /// FontWeight
  public enum FontWeight: String {
    case regular
    case medium
    case bold

    /// Custom font
    public var custom: String {
      switch self {
      case .regular: return R.font.gtWalsheimPro.fontName
      case .medium: return R.font.gtWalsheimProMedium.fontName
      case .bold: return R.font.gtWalsheimProBold.fontName
      }
    }

    /// System font
    public var system: Font.Weight {
      switch self {
      case .regular: return Font.Weight.regular
      case .medium: return Font.Weight.medium
      case .bold: return Font.Weight.bold
      }
    }
  }

  /// FontSize
  public enum FontSize: CaseIterable {
    /// 48
    case xl
    /// 40
    case lg
    /// 32
    case lg2
    /// 24
    case lg3
    /// 20
    case md
    /// 18
    case md2
    /// 16
    case md3
    /// 14
    case sm
    /// 13
    case sm2
    /// 12
    case sm3
    /// 11
    case xs

    public var value: (size: CGFloat, kerning: CGFloat) {
      switch self {
      case .xl: return (size: 48, kerning: -1.4)
      case .lg: return (size: 40, kerning: -1)
      case .lg2: return (size: 32, kerning: -0.7)
      case .lg3: return (size: 24, kerning: -0.4)
      case .md: return (size: 20, kerning: -0.3)
      case .md2: return (size: 18, kerning: -0.3)
      case .md3: return (size: 16, kerning: -0.1)
      case .sm: return (size: 14, kerning: 0)
      case .sm2: return (size: 13, kerning: 0)
      case .sm3: return (size: 12, kerning: 0)
      case .xs: return (size: 11, kerning: 0)
      }
    }
  }

  /// InputSize
  public enum InputSize {
    case xs
    case sm
    case md
    case lg
    case xl
    case custom(CGFloat)

    public var value: CGFloat {
      switch self {
      case .xs: return 28
      case .sm: return 32
      case .md: return 40
      case .lg: return 48
      case .xl: return 56
      case .custom(let custom): return custom
      }
    }
  }

  /// Roundness
  public enum Roundness {
    case sm
    case md
    case lg
    case full
    case custom(CGFloat)

    public var value: CGFloat {
      switch self {
      case .sm: return 4
      case .md: return 8
      case .lg: return 12
      case .full: return 100
      case .custom(let custom): return custom
      }
    }
  }

  /// IconSize
  public enum IconSize {
    case xs
    case sm
    case md
    case lg
    case xl
    case custom(CGFloat)

    public var value: CGFloat {
      switch self {
      case .xs: return 16
      case .sm: return 20
      case .md: return 24
      case .lg: return 28
      case .xl: return 32
      case .custom(let custom): return custom
      }
    }
  }
}

struct AppFontModifier: ViewModifier {
  let weight: FontWeight
  let size: FontSize
  let color: ColorTint
  let lineSpacing: CGFloat
  let isSystem: Bool

  public init(
    weight: FontWeight = .regular,
    size: FontSize,
    color: ColorTint,
    lineSpacing: CGFloat = 1,
    isSystem: Bool = false
  ) {
    self.weight = weight
    self.size = size
    self.color = color
    self.lineSpacing = lineSpacing
    self.isSystem = isSystem
  }

  func body(content: Content) -> some View {
    !isSystem ? content
      .font(.custom(weight.custom, size: size.value.size))
      .foregroundColor(color.color) :
      content
      .font(.system(size: size.value.size, weight: weight.system, design: .default))
      .foregroundColor(color.color)
  }
}

extension Text {
  /// Text modifier.
  func appFont(
    weight: FontWeight = .regular,
    size: FontSize,
    color: ColorTint,
    lineSpacing: CGFloat = 1,
    isKern: Bool = true,
    isSystem: Bool = false
  ) -> some View {
    kerning(isKern && !isSystem ? size.value.kerning : 0)
      .modifier(AppFontModifier(weight: weight, size: size, color: color, isSystem: isSystem))
      .frame(height: lineSpacing * size.value.size)
  }
}

extension TextField {
  /// TextField modifier.
  func appFont(
    weight: FontWeight = .regular,
    size: FontSize,
    color: ColorTint,
    lineSpacing: CGFloat = 1,
    isKern: Bool = true,
    isSystem: Bool = false
  ) -> some View {
    self
      .modifier(AppFontModifier(weight: weight, size: size, color: color, isSystem: isSystem))
      .frame(height: lineSpacing * size.value.size)
  }
}

extension Button {
  /// Button modifier.
  func appFont(
    weight: FontWeight = .regular,
    size: FontSize,
    color: ColorTint,
    lineSpacing: CGFloat = 1,
    isKern: Bool = true,
    isSystem: Bool = false
  ) -> some View {
    self
      .modifier(AppFontModifier(weight: weight, size: size, color: color, isSystem: isSystem))
      .frame(height: lineSpacing * size.value.size)
  }
}

extension View {
  /// View modifier.
  func appFont(
    weight: FontWeight = .regular,
    size: FontSize,
    color: ColorTint,
    lineSpacing: CGFloat = 1,
    isKern: Bool = true,
    isSystem: Bool = false
  ) -> some View {
    self
      .modifier(AppFontModifier(weight: weight, size: size, color: color, isSystem: isSystem))
      .frame(height: lineSpacing * size.value.size)
  }
}
