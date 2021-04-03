import SwiftUI

// MARK: - Font Modifiers

// struct AppFontModifier: ViewModifier {
//  let weight: FontWeight
//  let size: FontSize
//  let color: ColorTint
//  let lineSpacing: CGFloat
//  let isSystem: Bool
//
//  public init(
//    weight: FontWeight = .regular,
//    size: FontSize,
//    color: ColorTint,
//    lineSpacing: CGFloat = 1,
//    isSystem: Bool = false
//  ) {
//    self.weight = weight
//    self.size = size
//    self.color = color
//    self.lineSpacing = lineSpacing
//    self.isSystem = isSystem
//  }
//
//  func body(content: Content) -> some View {
//    !isSystem ? content
//      .font(.custom(weight.custom, size: size.value.size))
//      .foregroundColor(color.color) :
//      content
//      .font(.system(size: size.value.size, weight: weight.system, design: .default))
//      .foregroundColor(color.color)
//  }
// }
//
// extension Text {
//  /// Text modifier.
//  func appFont(
//    weight: FontWeight = .regular,
//    size: FontSize,
//    color: ColorTint,
//    lineSpacing: CGFloat = 1,
//    isKern: Bool = true,
//    isSystem: Bool = false
//  ) -> some View {
//    kerning(isKern && !isSystem ? size.value.kerning : 0)
//      .modifier(AppFontModifier(weight: weight, size: size, color: color, isSystem: isSystem))
//      .frame(height: lineSpacing * size.value.size)
//  }
// }
//
// extension TextField {
//  /// TextField modifier.
//  func appFont(
//    weight: FontWeight = .regular,
//    size: FontSize,
//    color: ColorTint,
//    lineSpacing: CGFloat = 1,
//    isKern: Bool = true,
//    isSystem: Bool = false
//  ) -> some View {
//    self
//      .modifier(AppFontModifier(weight: weight, size: size, color: color, isSystem: isSystem))
//      .frame(height: lineSpacing * size.value.size)
//  }
// }
//
// extension Button {
//  /// Button modifier.
//  func appFont(
//    weight: FontWeight = .regular,
//    size: FontSize,
//    color: ColorTint,
//    lineSpacing: CGFloat = 1,
//    isKern: Bool = true,
//    isSystem: Bool = false
//  ) -> some View {
//    self
//      .modifier(AppFontModifier(weight: weight, size: size, color: color, isSystem: isSystem))
//      .frame(height: lineSpacing * size.value.size)
//  }
// }
//
// extension View {
//  /// View modifier.
//  func appFont(
//    weight: FontWeight = .regular,
//    size: FontSize,
//    color: ColorTint,
//    lineSpacing: CGFloat = 1,
//    isKern: Bool = true,
//    isSystem: Bool = false
//  ) -> some View {
//    self
//      .modifier(AppFontModifier(weight: weight, size: size, color: color, isSystem: isSystem))
//      .frame(height: lineSpacing * size.value.size)
//  }
// }
