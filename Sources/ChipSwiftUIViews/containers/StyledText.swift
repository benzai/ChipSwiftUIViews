//import SwiftUI
//
/////
///// StyledText
/////
//public struct StyledText: View {
//  @EnvironmentObject private var theme: AppTheme
//
//  private let text: String
//  private let weight: FontWeight
//  private let size: FontSize
//  private let color: ColorTint
//  private let lineSpacing: CGFloat
//
//  public init(
//    _ text: String,
//    weight: FontWeight = .regular,
//    size: FontSize,
//    color: ColorTint,
//    lineSpacing: CGFloat = 1,
//  ) {
//    self.text = text
//  }
//
//  public var body: some View {
//    let _weight = AppThemeBuilder.fontWeight(weight: weight)
//    let _size = AppThemeBuilder.fontSize(size: size)
//    let _color = AppThemeBuilder.color(color: color)
//    
//    return Text(text)
//      .kerning(isKern && !isSystem ? _size.kerning : 0)
//      .modifier(AppFontModifier(weight: weight, size: size, color: color, isSystem: isSystem))
//      .frame(height: lineSpacing * _size.size)
//  }
//}
