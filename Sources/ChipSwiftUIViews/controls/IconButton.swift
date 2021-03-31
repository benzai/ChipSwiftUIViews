import SwiftUI

///
/// IconButton
///
struct IconButton: View {
  typealias InputSize = AppTheme.InputSize
  typealias IconSize = AppTheme.IconSize
  typealias OnTap = () -> Void
  private let iconImage: String
  private let frameSize: InputSize
  private let frameColor: Color
  private let iconSize: IconSize
  private let iconColor: Color
  private let onTap: OnTap?

  init(
    _ iconImage: String,
    frameSize: InputSize = .md,
    frameColor: Color = .black,
    iconSize: IconSize = .md,
    iconColor: Color = .white,
    onTap: OnTap? = nil
  ) {
    self.iconImage = iconImage
    self.frameSize = frameSize
    self.frameColor = frameColor
    self.iconSize = iconSize
    self.iconColor = iconColor
    self.onTap = onTap
  }

  var body: some View {
    Column {
      Image(iconImage)
        .resizable()
        .renderingMode(.template)
        .frame(width: iconSize.value, height: iconSize.value)
        .foregroundColor(iconColor)
    }
    .frameSize(frameSize.value)
    .background(frameColor)
    // TODO: Add other shapes, like rounded rect.
    .clipShape(Circle())
    .onTapGesture {
      if let onTap = onTap {
        onTap()
      }
    }
  }
}
