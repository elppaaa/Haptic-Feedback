//
//  ImpactFeedbackStyle.swift
//  Haptic Feedback
//
//  Created by JK on 2022/02/20.
//

import Foundation
import UIKit

enum ImpactFeedBackStyle: String, CaseIterable, Identifiable {
  var id: Self { self }
  
  case heavy = "Heavy"
  case medium = "Medium"
  case light = "Light"
  case rigid = "Rigid"
  case soft = "Soft"
}

extension ImpactFeedBackStyle {
  var item:  UIImpactFeedbackGenerator.FeedbackStyle {
    switch self {
    case .heavy: return .heavy
    case .medium: return .medium
    case .light: return .light
    case .rigid: return .rigid
    case .soft: return .soft
    }
  }
}
