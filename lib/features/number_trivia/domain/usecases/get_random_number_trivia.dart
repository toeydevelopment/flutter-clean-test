import 'package:tdd_example/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:tdd_example/features/number_trivia/domain/models/number_trivia_model.dart';
import 'package:tdd_example/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia {
  final NumberTriviaRepository numberTriviaRepository;

  const GetRandomNumberTrivia(this.numberTriviaRepository);

  Future<NumberTriviaModel> call() {
    return this.numberTriviaRepository.getRandomNumberTrivia();
  }
}
