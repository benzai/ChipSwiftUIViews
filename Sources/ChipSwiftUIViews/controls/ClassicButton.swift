import SwiftUI

// TODO: Move to Theme.
public enum ButtonSize {
  case sm, md, lg

  public var value: (frameHeight: CGFloat, sidePadding: CGFloat, textSize: FontSize) {
    switch self {
    case .sm: return (frameHeight: 40, sidePadding: 8, textSize: .md3)
    case .md: return (frameHeight: 48, sidePadding: 12, textSize: .md2)
    case .lg: return (frameHeight: 56, sidePadding: 16, textSize: .md)
    }
  }
}

///
/// ClassicButton
///
public struct ClassicButton: View {
  @EnvironmentObject private var theme: AppTheme

  public typealias OnTap = () -> Void
  private let title: String
  private let size: ButtonSize
  private let frameColor: Color
  private let textColor: Color
  private let roundness: Roundness
  private let isStretch: Bool
  private let onTap: OnTap

  public init(
    _ title: String,
    size: ButtonSize = .md,
    frameColor: Color,
    textColor: Color,
    roundness: Roundness = .md,
    isStretch: Bool = false,
    onTap: @escaping OnTap
  ) {
    self.title = title
    self.size = size
    self.frameColor = frameColor
    self.textColor = textColor
    self.roundness = roundness
    self.isStretch = isStretch
    self.onTap = onTap
  }

  public var body: some View {
    let _roundness = AppThemeBuilder.roundness(context: theme, size: roundness)

    return Button(action: onTap) {
      Text(title)
        .appFont(context: theme, size: size.value.textSize, color: .custom(textColor))
        .padding(.horizontal, size.value.sidePadding)
        .frame(maxWidth: isStretch ? .infinity : nil)
        .frame(height: size.value.frameHeight)
    }
    .background(frameColor)
    .cornerRadius(_roundness)
  }
}
