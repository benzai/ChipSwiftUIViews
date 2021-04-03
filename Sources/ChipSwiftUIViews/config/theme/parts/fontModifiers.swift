import SwiftUI

// MARK: - Font Modifiers

public struct AppFontModifier: ViewModifier {
  let context: AppTheme
  let weight: FontWeight
  let size: FontSize
  let color: ColorTint
  let lineSpacing: CGFloat
  let isSystem: Bool

  public init(
    context: AppTheme,
    weight: FontWeight = .regular,
    size: FontSize,
    color: ColorTint,
    lineSpacing: CGFloat = 1,
    isSystem: Bool = false
  ) {
    self.context = context
    self.weight = weight
    self.size = size
    self.color = color
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
  func appFont(
    context: AppTheme,
    weight: FontWeight = .regular,
    size: FontSize,
    color: ColorTint,
    lineSpacing: CGFloat = 1,
    isKern: Bool = true,
    isSystem: Bool = false
  ) -> some View {
    let _size = AppThemeBuilder.fontSize(context: context, size: size)

    return kerning(isKern && !isSystem ? _size.kerning : 0)
      .modifier(AppFontModifier(context: context, weight: weight, size: size, color: color,
                                isSystem: isSystem))
      .frame(height: lineSpacing * _size.size)
  }
}

public extension TextField {
  /// TextField modifier.
  func appFont(
    context: AppTheme,
    weight: FontWeight = .regular,
    size: FontSize,
    color: ColorTint,
    lineSpacing: CGFloat = 1,
    isKern: Bool = true,
    isSystem: Bool = false
  ) -> some View {
    let _size = AppThemeBuilder.fontSize(context: context, size: size)

    return self
      .modifier(AppFontModifier(context: context, weight: weight, size: size, color: color,
                                isSystem: isSystem))
      .frame(height: lineSpacing * _size.size)
  }
}

public extension Button {
  /// Button modifier.
  func appFont(
    context: AppTheme,
    weight: FontWeight = .regular,
    size: FontSize,
    color: ColorTint,
    lineSpacing: CGFloat = 1,
    isKern: Bool = true,
    isSystem: Bool = false
  ) -> some View {
    let _size = AppThemeBuilder.fontSize(context: context, size: size)

    return self
      .modifier(AppFontModifier(context: context, weight: weight, size: size, color: color,
                                isSystem: isSystem))
      .frame(height: lineSpacing * _size.size)
  }
}

public extension View {
  /// View modifier.
  func appFont(
    context: AppTheme,
    weight: FontWeight = .regular,
    size: FontSize,
    color: ColorTint,
    lineSpacing: CGFloat = 1,
    isKern: Bool = true,
    isSystem: Bool = false
  ) -> some View {
    let _size = AppThemeBuilder.fontSize(context: context, size: size)

    return self
      .modifier(AppFontModifier(context: context, weight: weight, size: size, color: color,
                                isSystem: isSystem))
      .frame(height: lineSpacing * _size.size)
  }
}
