//
//  MealItem.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MealItem: View {
  var meal: MealModel
  
  var body: some View {
    HStack {
      mealImage
      mealDescription
      Spacer()
    }
    .frame(width: UIScreen.main.bounds.width - 32)
    .overlay(RoundedRectangle(cornerRadius: 8)
      .stroke(Color.black.opacity(0.3), lineWidth: 0.8))
  }
}

extension MealItem {
  var mealImage: some View {
    WebImage(url: URL(string: meal.image))
      .resizable()
      .indicator(.activity)
      .scaledToFit()
      .frame(width: 65, height: 65)
      .cornerRadius(6)
  }
  
  var mealDescription: some View {
    VStack(alignment: .leading) {
      Text(meal.category)
        .font(.system(size: 14))
        .foregroundColor(Color.gray)
      Text(meal.name)
        .font(.system(size: 18, weight: .semibold))
        .foregroundColor(Color.black)
        .lineLimit(1)
    }
    .padding(.trailing, 8)
  }
}

