//
//  DetailView.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
  @ObservedObject var presenter: DetailPresenter
  
  var body: some View {
    ZStack {
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: 0) {
          nameOfMeal
          imageMeal
          description
        }
      }
    }
  }
}

extension DetailView {
  var imageMeal: some View {
    WebImage(url: URL(string: self.presenter.meal.image))
      .resizable()
      .indicator(.activity)
      .scaledToFit()
      .cornerRadius(8)
      .frame(width: UIScreen.main.bounds.width - 32, height: UIScreen.main.bounds.width - 32, alignment: .center)
      .overlay(RoundedRectangle(cornerRadius: 8)
        .stroke(Color.black.opacity(0.3), lineWidth: 0.5))
      .padding(.bottom, 8)
  }
  
  var nameOfMeal: some View {
    HStack {
      VStack(alignment: .leading, spacing: 0) {
        Text(self.presenter.meal.name)
          .font(.headline)
          .padding(.horizontal, 16)
        Text("\(self.presenter.meal.category) | \(self.presenter.meal.area)")
          .font(.system(size: 14))
          .foregroundColor(Color.gray.opacity(0.5))
          .padding(.horizontal, 16)
          .padding(.top, 4)
      }
      Spacer()
      if presenter.showFavoriteButton {
        Button(
          action: { presenter.favoriteButtonPressed() },
          label: {
            Image(systemName: presenter.isFavorited ? "star.fill" : "star")
              .foregroundColor(Color.black.opacity(0.3))
          }
        )
        .frame(alignment: .trailing)
        .padding(.horizontal, 16)
      }
    }
    .padding(.bottom, 10)
  }
  
  var description: some View {
    VStack(alignment: .leading) {
      Text("How to make: ")
        .font(.system(size: 12))
        .foregroundColor(Color.gray)
        .padding(.top, 10)
        .padding(.bottom, 2)
        .padding(.horizontal, 16)
      Text(self.presenter.meal.description)
        .font(.system(size: 14))
        .padding(.horizontal, 16)
    }
  }
}
