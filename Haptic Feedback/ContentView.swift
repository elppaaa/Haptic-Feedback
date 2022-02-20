//
//  ContentView.swift
//  Haptic Feedback
//
//  Created by JK on 2022/02/20.
//

import SwiftUI
import Combine

struct ContentView: View {
  @StateObject private var model = ViewModel()
  @State var impactValue: CGFloat = 0.0
  
  var body: some View {
    List {
      // MARK: Notification Feedback
      Section("Notification Feedback") {
        Button("Success", action: model.success)
        Button("Warning", action: model.warning)
        Button("Failure", action: model.error)
      }
      
      // MARK: Impact Feedback
      Section("Impact Feedback") {
        Picker("Favorite Color", selection: $model.impactStyle) {
          ForEach(ImpactFeedBackStyle.allCases) {
            Text($0.rawValue)
              .tag($0)
          }
        }
        .pickerStyle(.segmented)
        .listRowSeparator(.hidden)
        
        Button("Impact", action: model.impact)
          .listRowSeparator(.visible)
        Slider(value: $impactValue)
          .padding(.horizontal)
          .listRowSeparator(.hidden)
        Button("Impact \(String(format: "%.f", impactValue * 100))%", action: { model.impact(value: self.impactValue) })
          .padding(.vertical)
      }
      
      // MARK: Selection Feedback
      Section("Selection") {
        Button("Selection", action: model.selection)
      }
    }
    .buttonStyle(.plain)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
