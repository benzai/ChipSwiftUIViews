import SwiftUI

// MARK: - Font Modifiers

public struct AppFontModifier: ViewModifier {
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

  public func body(content: Content) -> some View {
    let _weight = AppThemeBuilder.fontWeight(weight: weight)
    let _size = AppThemeBuilder.fontSize(size: size)
    let _color = AppThemeBuilder.color(color: color)

    return content
      .font(.custom(_weight, size: _size.size))
      .foregroundColor(_color)
  }
}

public extension Text {
  /// Text modifier.
  func appFont(
    weight: FontWeight = .regular,
    size: FontSize,
    color: ColorTint,
    lineSpacing: CGFloat = 1,
    isKern: Bool = true,
    isSystem: Bool = false
  ) -> some View {
    let _size = AppThemeBuilder.fontSize(size: size)

    return kerning(isKern && !isSystem ? _size.kerning : 0)
      .modifier(AppFontModifier(weight: weight, size: size, color: color, isSystem: isSystem))
      .frame(height: lineSpacing * _size.size)
  }
}

public extension TextField {
  /// TextField modifier.
  func appFont(
    weight: FontWeight = .regular,
    size: FontSize,
    color: ColorTint,
    lineSpacing: CGFloat = 1,
    isKern: Bool = true,
    isSystem: Bool = false
  ) -> some View {
    let _size = AppThemeBuilder.fontSize(size: size)

    return self
      .modifier(AppFontModifier(weight: weight, size: size, color: color, isSystem: isSystem))
      .frame(height: lineSpacing * _size.size)
  }
}

public extension Button {
  /// Button modifier.
  func appFont(
    weight: FontWeight = .regular,
    size: FontSize,
    color: ColorTint,
    lineSpacing: CGFloat = 1,
    isKern: Bool = true,
    isSystem: Bool = false
  ) -> some View {
    let _size = AppThemeBuilder.fontSize(size: size)

    return self
      .modifier(AppFontModifier(weight: weight, size: size, color: color, isSystem: isSystem))
      .frame(height: lineSpacing * _size.size)
  }
}

public extension View {
  /// View modifier.
  func appFont(
    weight: FontWeight = .regular,
    size: FontSize,
    color: ColorTint,
    lineSpacing: CGFloat = 1,
    isKern: Bool = true,
    isSystem: Bool = false
  ) -> some View {
    let _size = AppThemeBuilder.fontSize(size: size)

    return self
      .modifier(AppFontModifier(weight: weight, size: size, color: color, isSystem: isSystem))
      .frame(height: lineSpacing * _size.size)
  }
}
