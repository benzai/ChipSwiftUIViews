import SwiftUI

// MARK: - Font Modifiers

public struct AppFontModifier: ViewModifier {
  let context: AppTheme
  let size: FontSize
  let color: ColorTint
  let weight: FontWeight
  let lineSpacing: CGFloat
  let isSystem: Bool

  public init(
    context: AppTheme,
    size: FontSize,
    color: ColorTint,
    weight: FontWeight = .regular,
    lineSpacing: CGFloat = 1,
    isSystem: Bool = false
  ) {
    self.context = context
    self.size = size
    self.color = color
    self.weight = weight
    self.lineSpacing = lineSpacing
    self.isSystem = isSystem
  }

  public func body(content: Content) -> some View {
    let _weight = AppThemeBuilder.fontWeight(context: context, weight: weight)
    let _size = AppThemeBuilder.fontSize(context: context, size: size)
    let _color = AppThemeBuilder.color(context: context, color: color)

    return content
      .font(.custom(_weight, size: _size.size))
      .foregroundColor(_color)
  }
}

public extension Text {
  /// Text modifier.
  /// - When isParagraph is false (default) it will set a frame height based on the font size.
  func appFont(
    context: AppTheme,
    size: FontSize,
    color: ColorTint,
    weight: FontWeight = .regular,
    isParagraph: Bool = false,
    lineSpacing: CGFloat = 1,
    isKern: Bool = true,
    isSystem: Bool = false
  ) -> some View {
    let _size = AppThemeBuilder.fontSize(context: context, size: size)

    let base = kerning(isKern && !isSystem ? _size.kerning : 0)
      .modifier(AppFontModifier(context: context, size: size, color: color,
                                weight: weight, isSystem: isSystem))
    let paragraph = base
    let normal = base
      .frame(height: lineSpacing * _size.size)

    return isParagraph ? paragraph.eraseToAnyView() : normal.eraseToAnyView()
  }
}

public extension TextField {
  /// TextField modifier.
  func appFont(
    context: AppTheme,
    size: FontSize,
    color: ColorTint,
    weight: FontWeight = .regular,
    lineSpacing: CGFloat = 1,
    isKern: Bool = true,
    isSystem: Bool = false
  ) -> some View {
    let _size = AppThemeBuilder.fontSize(context: context, size: size)

    return self
      .modifier(AppFontModifier(context: context, size: size, color: color,
                                weight: weight, isSystem: isSystem))
      .frame(height: lineSpacing * _size.size)
  }
}

public extension Button {
  /// Button appFont modifier.
  func appFont(
    context: AppTheme,
    size: FontSize,
    color: ColorTint,
    weight: FontWeight = .regular,
    lineSpacing: CGFloat = 1,
    isKern: Bool = true,
    isSystem: Bool = false
  ) -> some View {
    let _size = AppThemeBuilder.fontSize(context: context, size: size)

    return self
      .modifier(AppFontModifier(context: context, size: size, color: color,
                                weight: weight, isSystem: isSystem))
      .frame(height: lineSpacing * _size.size)
  }
}

public extension View {
  /// View appFont modifier.
  /// - When isParagraph is false (default) it will set a frame height based on the font size.
  func appFont(
    context: AppTheme,
    size: FontSize,
    color: ColorTint,
    weight: FontWeight = .regular,
    isParagraph: Bool = false,
    lineSpacing: CGFloat = 1,
    isKern: Bool = true,
    isSystem: Bool = false
  ) -> some View {
    let _size = AppThemeBuilder.fontSize(context: context, size: size)

    let base = self
      .modifier(AppFontModifier(context: context, size: size, color: color,
                                weight: weight, isSystem: isSystem))
    let paragraph = base
    let normal = base
      .frame(height: lineSpacing * _size.size)

    return isParagraph ? paragraph.eraseToAnyView() : normal.eraseToAnyView()
  }
}
