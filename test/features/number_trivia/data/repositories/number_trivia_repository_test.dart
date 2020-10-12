import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_example/core/vendors/data_connection_checker.dart';
import 'package:tdd_example/features/number_trivia/data/datasources/number_trivia_api_datasource.dart';
import 'package:tdd_example/features/number_trivia/data/datasources/number_trivia_cache_datasource.dart';
import 'package:tdd_example/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:tdd_example/features/number_trivia/domain/models/number_trivia_model.dart';
import 'package:tdd_example/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class MockDataConnectChecker extends Mock implements DataConnectChecker {}

class MockNumberTriviaApiDataSource extends Mock
    implements NumberTriviaApiDataSource {}

class MockNumberTriviaCacheDataSource extends Mock
    implements NumberTriviaCacheDataSource {}

void main() {
  MockDataConnectChecker checker;
  MockNumberTriviaApiDataSource apiDataSource;
  MockNumberTriviaCacheDataSource cacheDatasource;
  NumberTriviaRepository numberTriviaRepository;

  setUp(() {
    checker = MockDataConnectChecker();
    apiDataSource = MockNumberTriviaApiDataSource();
    cacheDatasource = MockNumberTriviaCacheDataSource();
    numberTriviaRepository = NumberTriviaRepositoryImpl(
      checker: checker,
      apiDataSource: apiDataSource,
      cacheDataSource: cacheDatasource,
    );
  });

  group("test get random number trivia", () {
    test("should return number trivia when can get from api", () async {
      final tNumbertrivia =
          NumberTriviaModel(found: true, number: 2, text: "tes", type: "test");

      // arrange
      when(checker.isConnect()).thenAnswer((realInvocation) async => false);
      when(apiDataSource.getRandomNumbertrivia()).thenAnswer(
        (_) async => tNumbertrivia,
      );
      when(cacheDatasource.getData()).thenReturn(
        tNumbertrivia,
      );
      // act
      final result = await numberTriviaRepository.getRandomNumberTrivia();
      // assert
      // verifyZeroInteractions(cacheDatasource.getData());
      expect(result, tNumbertrivia);
    });
  });
}
