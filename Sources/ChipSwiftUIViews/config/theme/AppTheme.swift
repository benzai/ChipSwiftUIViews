import SwiftUI
import Combine

///
/// AppTheme
///
public class AppTheme: ObservableObject {
  public static let shared = AppTheme()

  private var subs = Set<AnyCancellable>()

  // State
  @Published public var colors: AppThemeColors
  @Published public var styles: AppThemeStyles
  @Published public var statusBar: ColorScheme = .light

  // Init
  public init(
    colorTheme: AppThemeColors? = nil,
    styleTheme: AppThemeStyles? = nil
  ) {
    print("AppTheme")
    if let colorTheme = colorTheme {
      _colors = Published.init(initialValue: colorTheme)
    } else {
      _colors = Published.init(initialValue: DefaultThemeColors())
    }

    if let styleTheme = styleTheme {
      _styles = Published.init(initialValue: styleTheme)
    } else {
      _styles = Published.init(initialValue: DefaultThemeStyles())
    }
  }
}
