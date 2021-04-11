import SwiftUI

///
/// FieldGroupText
///
public struct FieldGroupText: View {
  @EnvironmentObject private var theme: AppTheme

  @Binding private var value: String
  private let label: String
  private let placeholder: String
  private let styleType: InputField.StyleType
  private let keyboardType: UIKeyboardType

  public init(
    value: Binding<String>,
    label: String,
    placeholder: String,
    styleType: InputField.StyleType = .classic,
    keyboardType: UIKeyboardType = .default
  ) {
    self._value = value
    self.label = label
    self.placeholder = placeholder
    self.styleType = styleType
    self.keyboardType = keyboardType
  }

  public var body: some View {
    Row {
      Text(label)
        .appFont(context: theme, size: .md2, color: .text2)
      VGap(4)
      InputField(text: $value, styleType: .modern)
        .frame(height: 36)
    }
    .lineSeparator()
    .padding(.top, 6)
  }
}
