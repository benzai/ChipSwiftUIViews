import SwiftUI
import Combine
import Rswift

///
/// AppTheme
/// - Pass a ColorTheme struct into the init to customize the theme.
///
public class AppTheme: ObservableObject {
  private var subs = Set<AnyCancellable>()

  // State
  @Published public var colors: ColorTheme
  @Published public var statusBar: ColorScheme = .light

  // Init
  public init(colorTheme: ColorTheme? = nil) {
    print("AppTheme")
    if let colorTheme = colorTheme {
      _colors = Published.init(initialValue: colorTheme)
    } else {
      _colors = Published.init(initialValue: DefaultTheme())
    }
  }
}

/// ColorTheme
public protocol ColorTheme {
  var accent1: Color { get }
  var accent2: Color { get }
  var text1: Color { get }
  var text2: Color { get }
  var text3: Color { get }
  var altText1: Color { get }
  var altText2: Color { get }
  var altText3: Color { get }
  var bg1: Color { get }
  var altBg1: Color { get }
  var statusPositive: Color { get }
  var statusWarning: Color { get }
  var statusNegative: Color { get }
  var iconIdle: Color { get }
  var iconActive: Color { get }
  var lineColor1: Color { get }
  var iconAccent: Color { get }
  var iconSupport: Color { get }
  var iconAlt: Color { get }
}

public struct DefaultTheme: ColorTheme {
  public var accent1: Color { Color("#FF0000") }
  public var accent2: Color { Color("#00FF00") }
  public var text1: Color { Color("#263340") }
  public var text2: Color { Color("#6B8299") }
  public var text3: Color { Color("#99ACBF") }
  public var altText1: Color { Color("#FCFCFC") }
  public var altText2: Color { Color("#FCFCFC") }
  public var altText3: Color { Color("#FCFCFC") }
  public var bg1: Color { Color("#FCFCFC") }
  public var altBg1: Color { Color("#394566") }
  public var statusPositive: Color { Color("#51D191") }
  public var statusWarning: Color { Color("#FF5901") }
  public var statusNegative: Color { Color("#FF5959") }
  public var iconIdle: Color { Color("#98ABBE") }
  public var iconActive: Color { Color("#383EFA") }
  public var lineColor1: Color { Color("#99ACBF") }
  public var iconAccent: Color { Color("#373DFA") }
  public var iconSupport: Color { Color("#99ACBF") }
  public var iconAlt: Color { Color("#FCFCFC") }
}

/// AppTheme implementation
/// Put this extension into your own app to customize the theme.
public extension AppTheme {
  /// FontFamily
  enum FontFamily: CaseIterable {
    case regular
    case medium
    case bold

    public var resource: FontResource {
      switch self {
      case .regular: return R.font.gtWalsheimPro
      case .medium: return R.font.gtWalsheimProMedium
      case .bold: return R.font.gtWalsheimProBold
      }
    }

    public var name: String {
      resource.fontName
    }
  }

  /// FontWeight
  enum FontWeight: String {
    case regular
    case medium
    case bold

    /// Custom font
    public var custom: String {
      switch self {
      case .regular: return FontFamily.regular.name
      case .medium: return FontFamily.medium.name
      case .bold: return FontFamily.bold.name
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
  enum FontSize: CaseIterable {
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

  enum InputSize {
    case xs
    case sm
    case md
    case lg
    case xl
    case custom(CGFloat)

    var value: CGFloat {
      switch self {
      case .xs: return 28
      case .sm: return 32
      case .md: return 40
      case .lg: return 48
      case .xl: return 56
      case .custom(let customSize): return customSize
      }
    }
  }

  enum IconSize {
    case xs
    case sm
    case md
    case lg
    case xl
    case custom(CGFloat)

    var value: CGFloat {
      switch self {
      case .xs: return 16
      case .sm: return 20
      case .md: return 24
      case .lg: return 28
      case .xl: return 32
      case .custom(let customSize): return customSize
      }
    }
  }
}
