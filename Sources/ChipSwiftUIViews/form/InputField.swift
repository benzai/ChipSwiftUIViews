import UIKit
import SwiftUI

public extension InputField {
  enum StyleType {
    case classic, modern
  }
}

///
/// InputField
/// - UITextField wrapper with custom padding.
///
public struct InputField: UIViewRepresentable {
  @EnvironmentObject private var theme: AppTheme

  public typealias ViewType = CustomUITextField

  @Binding private var text: String
  private let placeholder: String
  private let styleType: StyleType
  private let keyboardType: UIKeyboardType

  public init(
    text: Binding<String>,
    placeholder: String,
    styleType: StyleType = .classic,
    keyboardType: UIKeyboardType = .default
  ) {
    self._text = text
    self.placeholder = placeholder
    self.styleType = styleType
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

    textField.font = UIFont(
      name: theme.styles.fontWeight_regular,
      size: theme.styles.fontSize_md2.size
    )
    textField.textColor = UIColor(theme.colors.text1)

    setupView(styleType: styleType, textField: textField)

    return textField
  }

  func setupView(styleType: StyleType, textField: ViewType) {
    switch styleType {
    case .classic:
      textField.textPadding = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)

      textField.layer.cornerRadius = 8
      textField.clipsToBounds = true

      textField.layer.borderWidth = 1
      textField.layer.borderColor = Color.black.opacity(0.05).cgColor
      textField.backgroundColor = UIColor(theme.colors.text3.opacity(0.1))

    case .modern:
      textField.textPadding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
  }

  public func updateUIView(_ uiView: ViewType, context: Context) {
    uiView.text = text
  }

  public func makeCoordinator() -> Coordinator {
    Coordinator(parent: self, theme: theme)
  }

  // Coordinator
  public class Coordinator: NSObject, UITextFieldDelegate {
    public typealias Parent = InputField

    private let parent: Parent
    private let theme: AppTheme

    public init(parent: Parent, theme: AppTheme) {
      self.parent = parent
      self.theme = theme
    }

    public func textFieldDidChangeSelection(_ textField: UITextField) {
      parent.$text.wrappedValue = textField.text ?? ""
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

/// Credit: Advanced Swift https://www.advancedswift.com/uitextfield-with-padding-swift
public class CustomUITextField: UITextField {
  public var textPadding = UIEdgeInsets(
    top: 0,
    left: 12,
    bottom: 0,
    right: 12
  )

  override public func textRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.textRect(forBounds: bounds)
    return rect.inset(by: textPadding)
  }

  override public func editingRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.editingRect(forBounds: bounds)
    return rect.inset(by: textPadding)
  }
}
