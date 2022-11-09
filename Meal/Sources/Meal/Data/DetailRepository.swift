//
//  File.swift
//  
//
//  Created by CODEXANB015 on 28/10/22.
//

import CoreOfMealsMaker
import Combine

public struct DetailRepository<DetailLocaleDataSource: LocaleDataSource, Transformer: Mapper>: Repository
where
DetailLocaleDataSource.Request == MealDomainModel,
DetailLocaleDataSource.Response == Bool,
Transformer.Request == String,
Transformer.Response == [MealResponse],
Transformer.Entity == [FavoriteModuleEntity],
Transformer.Domain == [MealDomainModel],
Transformer.SingleDomain == MealDomainModel,
Transformer.SingleEntity == FavoriteModuleEntity
{
  
  public typealias Request = MealDomainModel
  public typealias Response = Bool
  
  
  private let _localeDataSource: DetailLocaleDataSource
  private let _mapper: Transformer
  
  public init(
    localeDataSource: DetailLocaleDataSource,
    mapper: Transformer
  ) {
    _localeDataSource = localeDataSource
    _mapper = mapper
  }
  
  public func execute(request: MealDomainModel?) -> AnyPublisher<Bool, Error> {
    return _localeDataSource.updateFav(domain: request)
      .eraseToAnyPublisher()
  }
  
  public func process(request: MealDomainModel?) -> AnyPublisher<Bool, Error> {
    return _localeDataSource.checkFavorite(domain: request)
  }
}
