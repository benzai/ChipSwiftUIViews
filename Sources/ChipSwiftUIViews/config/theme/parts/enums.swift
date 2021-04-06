import SwiftUI

// MARK: AppTheme Enums

public typealias ColorTint = AppThemeEnums.ColorTint
public typealias FontWeight = AppThemeEnums.FontWeight
public typealias FontSize = AppThemeEnums.FontSize
public typealias InputSize = AppThemeEnums.InputSize
public typealias IconSize = AppThemeEnums.IconSize
public typealias Roundness = AppThemeEnums.Roundness

public struct AppThemeEnums {
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
  }

  /// FontWeight
  public enum FontWeight {
    case regular, medium, bold
  }

  /// FontSize
  public enum FontSize: CaseIterable {
    case xl, lg, lg2, lg3, md, md2, md3, sm, sm2, sm3, xs
  }

  /// InputSize
  public enum InputSize {
    case xs, sm, md, lg, xl, custom(CGFloat)
  }

  /// IconSize
  public enum IconSize {
    case xs, sm, md, lg, xl
  }

  /// Roundness
  public enum Roundness {
    case sm, md, lg, full
  }
}
