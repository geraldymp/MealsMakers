//
//  File.swift
//  
//
//  Created by CODEXANB015 on 27/10/22.
//

import CoreOfMealsMaker
import Combine

public struct GetFavoritesRepository<FavoriteLocalDataSource: LocaleDataSource, Transformer: Mapper>: Repository
where
FavoriteLocalDataSource.Request == String,
FavoriteLocalDataSource.Response == FavoriteModuleEntity,
Transformer.Request == String,
Transformer.Response == [MealResponse],
Transformer.Entity == [FavoriteModuleEntity],
Transformer.Domain == [MealDomainModel] {
  
  
  public typealias Request = String
  public typealias Response = [MealDomainModel]
  
  private let _localeDataSource: FavoriteLocalDataSource
  private let _mapper: Transformer
  
  public init(
    localeDataSource: FavoriteLocalDataSource,
    mapper: Transformer
  ) {
      _localeDataSource = localeDataSource
      _mapper = mapper
    }
  
  public func execute(request: String?) -> AnyPublisher<[MealDomainModel], Error> {
    return _localeDataSource.list(request: request)
      .map{ _mapper.transformEntityToDomain(entity: $0) }
      .eraseToAnyPublisher()
  }
  
  public func process(request: String?) -> AnyPublisher<[MealDomainModel], Error> {
    fatalError()
  }
}

