//
//  AboutView.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import SwiftUI

struct AboutView: View {
  var body: some View {
    VStack {
      Image("formalPhoto")
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 150)
        .cornerRadius(8)
        .overlay(RoundedRectangle(cornerRadius: 8)
          .stroke(Color.black.opacity(0.3), lineWidth: 0.5))
      Text("Geraldy Martin Pangabean")
        .font(.system(size: 18, weight: .semibold))
        .foregroundColor(Color.black)
    }
  }
}
