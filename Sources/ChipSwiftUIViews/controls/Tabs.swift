import SwiftUI

///
/// Tabs
///
public struct Tabs: View {
  @EnvironmentObject private var theme: AppTheme

  public typealias OnTap = (Int) -> Void

  @Binding private var activeIndex: Int
  private let items: [TabItem]
  private let spacing: CGFloat
  private let roundness: Roundness
  private let baseColor: Color
  private let onTap: OnTap

  public init(
    activeIndex: Binding<Int>,
    items: [TabItem],
    baseColor: Color,
    roundness: Roundness = .md,
    spacing: CGFloat = 6,
    onTap: @escaping OnTap
  ) {
    _activeIndex = activeIndex
    self.items = items
    self.baseColor = baseColor
    self.roundness = roundness
    self.spacing = spacing
    self.onTap = onTap
  }

  public var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      Column(spacing: spacing) {
        ForEach(items.indices) { (index: Int) in
          let item = items[index]
          if index == activeIndex {
            ClassicButton(
              item.title,
              frameColor: baseColor,
              textColor: theme.colors.altText1,
              roundness: roundness
            ) {
              print("Already current active index.")
            }
            .disabled(true)
          } else {
            ClassicButton(
              item.title,
              frameColor: baseColor.opacity(0.1),
              textColor: baseColor,
              roundness: roundness
            ) {
              activeIndex = index
              onTap(index)
            }
          }
        }
      }
      .padding(10)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

public extension Tabs {
  struct TabItem: Identifiable {
    public let id: UUID = UUID()
    public let title: String

    public init(title: String) {
      self.title = title
    }
  }
}
