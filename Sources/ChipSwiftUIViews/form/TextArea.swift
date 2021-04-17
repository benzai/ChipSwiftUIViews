import UIKit
import SwiftUI

public extension TextArea {
  enum StyleType {
    case classic, modern
  }
}

///
/// TextArea
/// - UITextView wrapper (multiline textfield).
///
public struct TextArea: UIViewRepresentable {
  @EnvironmentObject private var theme: AppTheme

  public typealias ViewType = UITextView

  @Binding var text: String
  private let styleType: StyleType
  private let keyboardType: UIKeyboardType
  private let textDidChange: () -> Void

  public init(
    text: Binding<String>,
    styleType: StyleType = .classic,
    keyboardType: UIKeyboardType = .default,
    textDidChange: @escaping () -> Void
  ) {
    self._text = text
    self.styleType = styleType
    self.keyboardType = keyboardType
    self.textDidChange = textDidChange
  }

  public func makeUIView(context: Context) -> ViewType {
    let textView = ViewType()
    textView.delegate = context.coordinator

    textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    textView.keyboardType = keyboardType
    textView.autocorrectionType = .no
    textView.spellCheckingType = .no

    textView.font = UIFont(
      name: theme.styles.fontWeight_regular,
      size: theme.styles.fontSize_md2.size
    )
    textView.textColor = UIColor(theme.colors.text1)

    setupView(styleType: styleType, textView: textView)

    return textView
  }

  func setupView(styleType: StyleType, textView: ViewType) {
    switch styleType {
    case .classic:
      textView.textContainer.lineFragmentPadding = 0
      textView.textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)

      textView.layer.cornerRadius = 8
      textView.clipsToBounds = true

      textView.layer.borderWidth = 1
      textView.layer.borderColor = Color.black.opacity(0.05).cgColor
      textView.backgroundColor = UIColor(theme.colors.text3.opacity(0.1))

    case .modern:
      textView.textContainer.lineFragmentPadding = 0
      textView.textContainerInset = UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)
    }
  }

  public func updateUIView(_ uiView: ViewType, context: Context) {
    uiView.text = text
    DispatchQueue.main.async {
      self.textDidChange()
    }
  }

  public func makeCoordinator() -> Coordinator {
    Coordinator(parent: self, theme: theme)
  }

  // Coordinator
  public class Coordinator: NSObject, UITextViewDelegate {
    public typealias Parent = TextArea

    private let parent: Parent
    private let theme: AppTheme

    public init(parent: Parent, theme: AppTheme) {
      self.parent = parent
      self.theme = theme
    }

    public func textViewDidChange(_ textView: ViewType) {
      parent.$text.wrappedValue = textView.text
      parent.textDidChange()
    }

//    public func textViewDidBeginEditing(_ textView: ViewType) {
//      textView.layer.borderWidth = 2
//      textView.layer.borderColor = UIColor(theme.colors.accent1.opacity(0.6)).cgColor
//      textView.backgroundColor = UIColor(theme.colors.bg1)
//    }
//
//    public func textViewDidEndEditing(_ textView: ViewType) {
//      textView.layer.borderWidth = 1
//      textView.layer.borderColor = Color.black.opacity(0.05).cgColor
//      textView.backgroundColor = UIColor(theme.colors.text3.opacity(0.1))
//    }
  }
}
