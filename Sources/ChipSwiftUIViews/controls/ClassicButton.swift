import SwiftUI

///
/// ClassicButton
///
public struct ClassicButton: View {
  @EnvironmentObject private var theme: AppTheme

  public typealias OnTap = () -> Void
  private let title: String
  private let frameSize: InputSize
  private let frameColor: Color
  private let roundness: Roundness
  private let onTap: OnTap

  public init(
    _ title: String,
    frameSize: InputSize = .md,
    frameColor: Color = .black,
    roundness: Roundness = .md,
    onTap: @escaping OnTap
  ) {
    self.title = title
    self.frameSize = frameSize
    self.frameColor = frameColor
    self.roundness = roundness
    self.onTap = onTap
  }

  public var body: some View {
    let _frameSize = AppThemeBuilder.inputSize(context: theme, size: frameSize)
    let _roundness = AppThemeBuilder.roundness(context: theme, size: roundness)

    return Button(action: onTap) {
      Text(title)
    }
    .padding(.horizontal, 20)
    .frame(height: _frameSize)
    .background(frameColor)
    .cornerRadius(_roundness)
  }
}
