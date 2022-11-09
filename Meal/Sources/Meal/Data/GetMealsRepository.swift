//
//  File.swift
//  
//
//  Created by CODEXANB015 on 27/10/22.
//

import CoreOfMealsMaker
import Combine

// 1
public struct GetMealsRepository<
  MealLocaleDataSource: LocaleDataSource,
  RemoteDataSource: DataSource,
  Transformer: Mapper>: Repository
where
// 2
MealLocaleDataSource.Response == MealModuleEntity,
RemoteDataSource.Response == [MealResponse],
Transformer.Response == [MealResponse],
Transformer.Entity == [MealModuleEntity],
Transformer.Domain == [MealDomainModel] {
  
  
  // 3
  public typealias Request = Any
  public typealias Response = [MealDomainModel]
  
  private let _localeDataSource: MealLocaleDataSource
  private let _remoteDataSource: RemoteDataSource
  private let _mapper: Transformer
  
  public init(
    localeDataSource: MealLocaleDataSource,
    remoteDataSource: RemoteDataSource,
    mapper: Transformer) {
      
      _localeDataSource = localeDataSource
      _remoteDataSource = remoteDataSource
      _mapper = mapper
    }
  
  // 4
  public func execute(request: Any?) -> AnyPublisher<[MealDomainModel], Error> {
    return _localeDataSource.list(request: nil)
      .flatMap { result -> AnyPublisher<[MealDomainModel], Error> in
        if result.isEmpty {
          return _remoteDataSource.execute(request: nil)
            .map { _mapper.transformResponseToEntity(request: nil, response: $0) }
            .catch { _ in _localeDataSource.list(request: nil) }
            .flatMap { _localeDataSource.add(entities: $0) }
            .filter { $0 }
            .flatMap { _ in _localeDataSource.list(request: nil)
                .map { _mapper.transformEntityToDomain(entity: $0) }
            }
            .eraseToAnyPublisher()
        } else {
          return _localeDataSource.list(request: nil)
            .map { _mapper.transformEntityToDomain(entity: $0) }
            .eraseToAnyPublisher()
        }
      }.eraseToAnyPublisher()
  }
  
  public func process(request: Request?) -> AnyPublisher<[MealDomainModel], Error> {
    fatalError()
  }
}
