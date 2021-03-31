import SwiftUI

///
/// IconFrame
///
public struct IconFrame: View {
  public typealias InputSize = AppTheme.InputSize
  public typealias IconSize = AppTheme.IconSize
  private let iconImage: String
  private let frameSize: InputSize
  private let frameColor: Color
  private let iconSize: IconSize
  private let iconColor: Color

  public init(
    _ iconImage: String,
    frameSize: InputSize = .md,
    frameColor: Color = .black,
    iconSize: IconSize = .md,
    iconColor: Color = .white
  ) {
    self.iconImage = iconImage
    self.frameSize = frameSize
    self.frameColor = frameColor
    self.iconSize = iconSize
    self.iconColor = iconColor
  }

  public var body: some View {
    Column {
      Image(iconImage)
        .resizable()
        .renderingMode(.template)
        .frame(width: iconSize.value, height: iconSize.value)
        .foregroundColor(iconColor)
    }
    .frameSize(frameSize.value)
    .background(frameColor)
    .clipShape(Circle())
  }
}
