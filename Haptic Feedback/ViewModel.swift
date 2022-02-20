//
//  ViewModel.swift
//  Haptic Feedback
//
//  Created by JK on 2022/02/20.
//

import Combine
import SwiftUI

final class ViewModel: ObservableObject {
  @Published var impactStyle: ImpactFeedBackStyle = .heavy
  var cancellable: AnyCancellable?
  var notificationFeedbackGenerator: UINotificationFeedbackGenerator?
  var impactFeedbackGenerator: UIImpactFeedbackGenerator?
  var selectionFeedbackGenerator: UISelectionFeedbackGenerator?
  
  init() {
    setupGenerator()
    cancellable = $impactStyle
      .sink { [weak self] in
        self?.impactFeedbackGenerator = .init(style: $0.item)
        self?.impactFeedbackGenerator?.prepare()
      }
  }
  
  private func setupGenerator() {
    self.notificationFeedbackGenerator = UINotificationFeedbackGenerator()
    self.notificationFeedbackGenerator?.prepare()
    
    self.selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    self.selectionFeedbackGenerator?.prepare()
  }
  
  func success() {
    self.notificationFeedbackGenerator?.notificationOccurred(.success)
  }
  
  func warning() {
    notificationFeedbackGenerator?.notificationOccurred(.warning)
  }
  
  func error() {
    notificationFeedbackGenerator?.notificationOccurred(.error)
  }
  
  func impact() {
    impactFeedbackGenerator?.impactOccurred()
  }
  
  func impact(value: CGFloat) {
    impactFeedbackGenerator?.impactOccurred(intensity: value)
  }
  
  func selection() {
    self.selectionFeedbackGenerator?.selectionChanged()
  }
}
