import 'package:tdd_example/features/number_trivia/domain/models/number_trivia_model.dart';

abstract class NumberTriviaRepository {
  Future<NumberTriviaModel> getRandomNumberTrivia();
}
