import SwiftUI

///
/// IconButton
///
public struct IconButton: View {
  @EnvironmentObject private var theme: AppTheme

  public typealias OnTap = () -> Void
  private let iconImage: String
  private let frameSize: InputSize
  private let frameColor: Color
  private let iconSize: IconSize
  private let iconColor: Color
  private let onTap: OnTap?

  public init(
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

  public var body: some View {
    let _frameSize = AppThemeBuilder.inputSize(context: theme, size: frameSize)
    let _iconSize = AppThemeBuilder.iconSize(context: theme, size: iconSize)

    return Column {
      Image(iconImage)
        .resizable()
        .renderingMode(.template)
        .frameSize(_iconSize)
        .foregroundColor(iconColor)
    }
    .frameSize(_frameSize)
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
