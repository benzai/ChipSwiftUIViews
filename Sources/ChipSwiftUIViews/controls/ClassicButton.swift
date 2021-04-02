import SwiftUI

///
/// ClassicButton
///
public struct ClassicButton: View {
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
    Button(action: onTap) {
      Text(title)
    }
    .padding(.horizontal, 20)
    .frame(height: frameSize.value)
    .background(frameColor)
    .cornerRadius(roundness.value)
  }
}
