//
//  File.swift
//
//
//  Created by Benny Chew on 08/04/2021.
//

import UIKit
import SwiftUI

public struct WrappedTextView: UIViewRepresentable {
  public typealias UIViewType = UITextView

  @Binding var text: String
  public let textDidChange: (UITextView) -> Void
  
  public init(
    text: Binding<String>,
    textDidChange: @escaping (UITextView) -> Void
  ) {
    self._text = text
    self.textDidChange = textDidChange
  }

  public func makeUIView(context: Context) -> UITextView {
    let view = UITextView()
    view.isEditable = true
    view.delegate = context.coordinator
    return view
  }

  public func updateUIView(_ uiView: UITextView, context: Context) {
    uiView.text = self.text
    DispatchQueue.main.async {
      self.textDidChange(uiView)
    }
  }

  public func makeCoordinator() -> Coordinator {
    return Coordinator(text: $text, textDidChange: textDidChange)
  }

  public class Coordinator: NSObject, UITextViewDelegate {
    @Binding public var text: String
    public let textDidChange: (UITextView) -> Void

    public init(text: Binding<String>, textDidChange: @escaping (UITextView) -> Void) {
      self._text = text
      self.textDidChange = textDidChange
    }

    public func textViewDidChange(_ textView: UITextView) {
      self.text = textView.text
      self.textDidChange(textView)
    }
  }
}
