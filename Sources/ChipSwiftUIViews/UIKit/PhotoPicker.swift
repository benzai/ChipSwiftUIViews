//import UIKit
//import SwiftUI
//import PhotosUI
//
/////
///// PhotoPicker
///// PHPickerViewController SwiftUI Wrapper.
/////
//struct PhotoPicker: UIViewControllerRepresentable {
//  @Environment(\.presentationMode) private var presentationMode
//
//  @Binding var isPresented: Bool
//  @Binding var results: [UIImage]
//
//  func makeUIViewController(context: Context) -> PHPickerViewController {
//    var configuration = PHPickerConfiguration()
//    configuration.filter = .images
//    configuration.selectionLimit = 1
//    let controller = PHPickerViewController(configuration: configuration)
//    controller.delegate = context.coordinator
//    return controller
//  }
//
//  func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
//
//  func makeCoordinator() -> Coordinator {
//    Coordinator(self)
//  }
//
//  // MARK: - Coordinator
//
//  class Coordinator: NSObject, PHPickerViewControllerDelegate {
//    private let parent: PhotoPicker
//
//    init(_ parent: PhotoPicker) {
//      self.parent = parent
//    }
//
//    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//      parent.isPresented.toggle()
//
//      guard !results.isEmpty, let firstImage = results.first else { return }
//
//      // Only one image
//      if firstImage.itemProvider.canLoadObject(ofClass: UIImage.self) {
//        firstImage.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
//          guard let image = image as? UIImage else { return }
//          DispatchQueue.main.async {
//            self.parent.results.append(image)
//          }
//        }
//      }
//    }
//  }
//}
