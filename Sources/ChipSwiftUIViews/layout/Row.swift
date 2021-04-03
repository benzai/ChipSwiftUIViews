import SwiftUI

///
/// Row
/// - VStack with a default spacing of 0.
///
public struct Row<Content>: View where Content: View {
  private let alignment: HorizontalAlignment
  private let spacing: CGFloat
  private let content: Content

  public init(
    alignment: HorizontalAlignment = .leading,
    spacing: CGFloat = 0,
    @ViewBuilder content: () -> Content
  ) {
    self.alignment = alignment
    self.spacing = spacing
    self.content = content()
  }

  public var body: some View {
    VStack(alignment: alignment, spacing: spacing) {
      content
    }
  }
}

