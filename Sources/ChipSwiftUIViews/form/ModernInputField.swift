import UIKit
import SwiftUI

///
/// InputField
/// - UITextField wrapper with custom padding.
///
public struct ModernInputField: UIViewRepresentable {
  @EnvironmentObject private var theme: AppTheme

  public typealias ViewType = CustomUITextField

  // Init
  @Binding private var text: String
  private let placeholder: String
  private let keyboardType: UIKeyboardType

  public init(
    text: Binding<String>,
    placeholder: String = "",
    keyboardType: UIKeyboardType = .default
  ) {
    self._text = text
    self.placeholder = placeholder
    self.keyboardType = keyboardType
  }

  public func makeUIView(context: Context) -> ViewType {
    let textField = ViewType(frame: .zero)
    textField.delegate = context.coordinator

    textField.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    textField.keyboardType = keyboardType
    textField.autocorrectionType = .no
    textField.spellCheckingType = .no

    textField.placeholder = placeholder

    textField.textPadding = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
    textField.font = UIFont(
      name: theme.styles.fontWeight_regular,
      size: theme.styles.fontSize_md2.size
    )
    textField.textColor = UIColor(theme.colors.text1)

    return textField
  }

  public func updateUIView(_ uiView: ViewType, context: Context) {
    uiView.text = text
  }

  public func makeCoordinator() -> Coordinator {
    Coordinator(parent: self, theme: theme)
  }

  // Coordinator
  public class Coordinator: NSObject, UITextFieldDelegate {
    public typealias Parent = ModernInputField

    private let parent: Parent
    private let theme: AppTheme

    public init(parent: Parent, theme: AppTheme) {
      self.parent = parent
      self.theme = theme
    }

//    public func textFieldDidBeginEditing(_ textField: UITextField) {
//      textField.layer.borderWidth = 2
//      textField.layer.borderColor = UIColor(theme.colors.accent1.opacity(0.6)).cgColor
//      textField.backgroundColor = UIColor(theme.colors.bg1)
//    }
//
//    public func textFieldDidEndEditing(_ textField: UITextField) {
//      textField.layer.borderWidth = 1
//      textField.layer.borderColor = Color.black.opacity(0.05).cgColor
//      textField.backgroundColor = UIColor(theme.colors.text3.opacity(0.1))
//    }
  }
}
