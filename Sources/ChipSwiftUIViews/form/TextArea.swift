import UIKit
import SwiftUI

///
/// TextArea
/// - UITextView wrapper (multiline textfield).
///
public struct TextArea: UIViewRepresentable {
  @EnvironmentObject private var theme: AppTheme

  public typealias ViewType = UITextView

  @Binding var text: String
  private let keyboardType: UIKeyboardType
  private let textDidChange: (ViewType) -> Void

  public init(
    text: Binding<String>,
    keyboardType: UIKeyboardType = .default,
    textDidChange: @escaping (ViewType) -> Void
  ) {
    self._text = text
    self.keyboardType = keyboardType
    self.textDidChange = textDidChange
  }

  public func makeUIView(context: Context) -> ViewType {
    let textView = ViewType()
    textView.delegate = context.coordinator

    textView.keyboardType = keyboardType
    textView.autocorrectionType = .no
    textView.spellCheckingType = .no

    textView.textContainer.lineFragmentPadding = 0
    textView.textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    textView.font = UIFont(
      name: theme.styles.fontWeight_regular,
      size: theme.styles.fontSize_md2.size
    )
    textView.textColor = UIColor(theme.colors.text1)
    textView.layer.cornerRadius = 8
    textView.clipsToBounds = true

    textView.layer.borderWidth = 1
    textView.layer.borderColor = Color.black.opacity(0.05).cgColor
    textView.backgroundColor = UIColor(theme.colors.text3.opacity(0.1))

    return textView
  }

  public func updateUIView(_ uiView: ViewType, context: Context) {
    uiView.text = self.text
    DispatchQueue.main.async {
      self.textDidChange(uiView)
    }
  }

  public func makeCoordinator() -> Coordinator {
    return Coordinator(text: $text, theme: theme, textDidChange: textDidChange)
  }

  // Coordinator
  public class Coordinator: NSObject, UITextViewDelegate {
    public typealias ViewType = UITextView

    @Binding private var text: String
    private let theme: AppTheme
    private let textDidChange: (ViewType) -> Void

    public init(
      text: Binding<String>,
      theme: AppTheme,
      textDidChange: @escaping (ViewType) -> Void
    ) {
      self._text = text
      self.theme = theme
      self.textDidChange = textDidChange
    }

    public func textViewDidChange(_ textView: ViewType) {
      text = textView.text
      textDidChange(textView)
    }

    public func textViewDidBeginEditing(_ textView: ViewType) {
      textView.layer.borderWidth = 2
      textView.layer.borderColor = UIColor(theme.colors.accent1.opacity(0.6)).cgColor
      textView.backgroundColor = UIColor(theme.colors.bg1)
    }

    public func textViewDidEndEditing(_ textView: ViewType) {
      textView.layer.borderWidth = 1
      textView.layer.borderColor = Color.black.opacity(0.05).cgColor
      textView.backgroundColor = UIColor(theme.colors.text3.opacity(0.1))
    }
  }
}
