import SwiftUI

///
/// FieldGroupText
/// - Multi line text.
///
public struct FieldGroupText: View {
  @EnvironmentObject private var theme: AppTheme

  @Binding private var value: String
  private let label: String
  private let placeholder: String
  private let frameHeight: CGFloat
  private let styleType: TextArea.StyleType
  private let keyboardType: UIKeyboardType

  public init(
    value: Binding<String>,
    label: String,
    placeholder: String,
    frameHeight: CGFloat,
    styleType: TextArea.StyleType = .classic,
    keyboardType: UIKeyboardType = .default
  ) {
    self._value = value
    self.label = label
    self.placeholder = placeholder
    self.frameHeight = frameHeight
    self.styleType = styleType
    self.keyboardType = keyboardType
  }

  public var body: some View {
    Row {
      Text(label)
        .appFont(context: theme, size: .md3, color: .text2)
      VGap(4)
      TextArea(text: $value, styleType: styleType, keyboardType: keyboardType) {}
        .frame(height: frameHeight)
    }
    .lineSeparator()
    .padding(.top, 6)
  }
}
