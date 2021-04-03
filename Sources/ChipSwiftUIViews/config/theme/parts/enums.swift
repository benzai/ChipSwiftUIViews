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
}
