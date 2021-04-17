import SwiftUI

///
/// FormGroup
///
public struct FormGroup<Content>: View where Content: View {
  private let paddingVertical: CGFloat
  private let content: Content

  public init(
    paddingVertical: CGFloat = 10,
    @ViewBuilder content: () -> Content
  ) {
    self.paddingVertical = paddingVertical
    self.content = content()
  }

  public var body: some View {
    Row {
      content
    }
    .padding(.vertical, paddingVertical)
    .frameListItem()
  }
}
