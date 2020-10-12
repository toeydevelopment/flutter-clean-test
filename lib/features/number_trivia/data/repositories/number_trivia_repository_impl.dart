import 'package:flutter/material.dart';
import 'package:tdd_example/core/vendors/data_connection_checker.dart';
import 'package:tdd_example/features/number_trivia/data/datasources/number_trivia_api_datasource.dart';
import 'package:tdd_example/features/number_trivia/data/datasources/number_trivia_cache_datasource.dart';
import 'package:tdd_example/features/number_trivia/domain/models/number_trivia_model.dart';
import 'package:tdd_example/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final DataConnectChecker checker;
  final NumberTriviaApiDataSource apiDataSource;
  final NumberTriviaCacheDataSource cacheDataSource;

  const NumberTriviaRepositoryImpl({
    @required this.checker,
    @required this.apiDataSource,
    @required this.cacheDataSource,
  });

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    if (await this.checker.isConnect()) {
      final numberTrivia = await this.apiDataSource.getRandomNumbertrivia();
      await this.cacheDataSource.setData(numberTrivia);
      return numberTrivia;
    } else {
      return this.cacheDataSource.getData();
    }
  }
}
