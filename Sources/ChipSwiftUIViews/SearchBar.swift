import UIKit
import SwiftUI

///
/// SearchBar
/// UISearchBar SwiftUI wrapper.
///
struct SearchBar: UIViewRepresentable {
  @Binding var text: String
  var placeholder: String = ""

  func makeUIView(context: Context) -> UISearchBar {
    let searchBar = UISearchBar(frame: .zero)
    searchBar.delegate = context.coordinator
    searchBar.searchBarStyle = .minimal
    searchBar.autocapitalizationType = .none
    searchBar.placeholder = placeholder
    return searchBar
  }

  func updateUIView(_ uiView: UISearchBar, context: Context) {
    uiView.text = text
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  // MARK: - Coordinator

  class Coordinator: NSObject, UISearchBarDelegate {
    private let parent: SearchBar

    init(_ parent: SearchBar) {
      self.parent = parent
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      parent.text = searchText
    }
  }
}
