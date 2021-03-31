import SwiftUI

///
/// Image Mods
///
public extension Image {
  /// Circular image.
  func circularImage(size: CGFloat = 40) -> some View {
    self
      .resizable()
      .clipShape(Circle())
      .frame(width: size, height: size)
  }
}
