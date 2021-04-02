import SwiftUI
import Combine

///
/// ChipAppTheme
/// - Pass a ColorTheme struct into the init to customize the theme.
///
open class ChipAppTheme: ObservableObject {
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
  var bg2: Color { get }
  var altBg1: Color { get }
  var altBg2: Color { get }
  var statusPositive: Color { get }
  var statusWarning: Color { get }
  var statusNegative: Color { get }
}

public struct DefaultTheme: ColorTheme {
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
}
