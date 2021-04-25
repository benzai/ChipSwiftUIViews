import SwiftUI

///
/// FrameFullWidthMod
///
public struct FrameFullWidthMod: ViewModifier {
  private let alignment: Alignment

  init(alignment: Alignment = .leading) {
    self.alignment = alignment
  }

  public func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity, alignment: alignment)
  }
}

public extension View {
  /// Set the frame width to infinity, leading alignment by default.
  func frameFullWidth(alignment: Alignment = .leading) -> some View {
    modifier(FrameFullWidthMod(alignment: alignment))
  }

  /// Set the frame width to infinity, center alignment.
  func frameFullWidthCenter() -> some View {
    modifier(FrameFullWidthMod(alignment: .center))
  }
}
