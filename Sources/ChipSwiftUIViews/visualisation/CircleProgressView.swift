import SwiftUI

///
/// BindableCircularProgressView
///
public struct BindableCircularProgressView: View {
  @Binding private var progress: Float
  private let frameSize: CGFloat
  private let lineWidth: CGFloat
  private let baseColor: Color
  private let progressColor: Color

  public init(
    progress: Binding<Float>,
    frameSize: CGFloat = 40,
    lineWidth: CGFloat = 4,
    baseColor: Color = .gray,
    progressColor: Color = .blue
  ) {
    _progress = progress
    self.frameSize = frameSize
    self.lineWidth = lineWidth
    self.baseColor = baseColor
    self.progressColor = progressColor
  }

  public var body: some View {
    let padding = lineWidth / 2
    return ZStack {
      Circle()
        .stroke(lineWidth: lineWidth)
        .opacity(0.2)
        .foregroundColor(baseColor)
        .padding(padding)

      Circle()
        .trim(from: 0, to: CGFloat(min(progress, 1)))
        .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
        .rotationEffect(Angle(degrees: 270))
        .foregroundColor(progressColor)
        .padding(padding)
        .animation(.linear)
    }
    .frameSize(frameSize)
  }
}

///
/// CircularProgressView
///
public struct CircularProgressView: View {
  private let progress: Float
  private let frameSize: CGFloat
  private let lineWidth: CGFloat
  private let baseColor: Color
  private let progressColor: Color

  public init(
    progress: Float,
    frameSize: CGFloat = 40,
    lineWidth: CGFloat = 4,
    baseColor: Color = .gray,
    progressColor: Color = .blue
  ) {
    self.progress = progress
    self.frameSize = frameSize
    self.lineWidth = lineWidth
    self.baseColor = baseColor
    self.progressColor = progressColor
  }

  public var body: some View {
    let padding = lineWidth / 2
    return ZStack {
      Circle()
        .stroke(lineWidth: lineWidth)
        .opacity(0.2)
        .foregroundColor(baseColor)
        .padding(padding)

      Circle()
        .trim(from: 0, to: CGFloat(min(progress, 1)))
        .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
        .rotationEffect(Angle(degrees: 270))
        .foregroundColor(progressColor)
        .padding(padding)
        .animation(.linear)
    }
    .frameSize(frameSize)
  }
}
