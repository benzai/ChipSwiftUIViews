import SwiftUI
import ChipSwiftUIViews

///
/// PageScaffold
///
struct PageScaffold<Content>: View where Content: View {
  @EnvironmentObject private var theme: AppTheme

  private let type: PageType
  private let title: String
  private let backgroundColor: Color
  private let onAppear: () -> Void
  private let content: Content

  @inlinable public init(
    type: PageType = .navigationView,
    title: String,
    backgroundColor: Color = .white,
    onAppear: @escaping () -> Void,
    @ViewBuilder content: () -> Content
  ) {
    self.type = type
    self.title = title
    self.backgroundColor = backgroundColor
    self.onAppear = onAppear
    self.content = content()
  }

  var body: some View {
    switch type {
    case .navigationView:
      return NavigationView {
        mainContent
      }
      .eraseToAnyView()
    case .detail:
      return mainContent
        .eraseToAnyView()
    }
  }
}

private extension PageScaffold {
  var mainContent: some View {
    content
      .frame(maxWidth: .infinity, alignment: .leading)
      .background(backgroundColor)

      .navigationBarTitle(title, displayMode: .inline)
      .navigationViewStyle(StackNavigationViewStyle())

      .edgesIgnoringSafeArea(.bottom)
      .preferredColorScheme(theme.statusBar)

      .onAppear(perform: onAppear)
  }
}

extension PageScaffold {
  enum PageType {
    case navigationView
    case detail
  }
}
