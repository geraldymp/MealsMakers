//
//  ContentView.swift
//  MealsMakers
//
//  Created by CODEXANB015 on 22/10/22.
//

import SwiftUI
import CoreOfMealsMaker
import Meal

struct ContentView: View {
  @EnvironmentObject var homePresenter: GetListPresenter<Any, MealDomainModel, Interactor<Any, [MealDomainModel], GetMealsRepository<GetMealsLocaleDataSource, GetMealsRemoteDataSource, MealTransformer>>>
  var body: some View {
    NavigationView {
      HomeView(presenter: homePresenter)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
