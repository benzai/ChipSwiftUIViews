import UIKit
import SwiftUI

public extension View {
  func eraseToAnyView() -> AnyView {
    AnyView(self)
  }
}

extension View {
  func dismissKeyboard() {
    UIApplication.shared.sendAction(
      #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil
    )
  }
}
