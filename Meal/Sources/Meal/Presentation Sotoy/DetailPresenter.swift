//
//  File.swift
//  
//
//  Created by CODEXANB015 on 28/10/22.
//

import SwiftUI
import Combine
import CoreOfMealsMaker

public class DetailPresenter<Request, Response, Interactor: UseCase>: ObservableObject where Interactor.Request == Request, Interactor.Response == Response {

  private var cancellables: Set<AnyCancellable> = []
  
  private let _useCase: Interactor
  
  @Published public var list: [Response] = []
  @Published public var errorMessage: String = ""
  @Published public var isLoading: Bool = false
  @Published public var isError: Bool = false
  @Published public var isFavorite: Bool = false
  
  public init(
    useCase: Interactor
  ) {
    _useCase = useCase
  }
  
  public func updateFav(request: Request?) {
    isFavorite = !isFavorite
    _useCase.execute(request: request)
      .receive(on: RunLoop.main)
  }
  
  public func checkFavorite(request: Request) {
    _useCase.process(request: request)
      .receive(on: RunLoop.main)
      .sink(receiveCompletion: { _ in
        
      }, receiveValue: { isFavorite in
        self.isFavorite = isFavorite as! Bool
      })
      .store(in: &cancellables)
  }
}
