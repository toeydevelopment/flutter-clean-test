import 'package:tdd_example/core/datasource/cache.abstract.dart';
import 'package:tdd_example/core/exceptions/exceptions.dart';
import 'package:tdd_example/core/vendors/shared-pref.dart';
import 'package:tdd_example/features/number_trivia/domain/models/number_trivia_model.dart';

abstract class NumberTriviaCacheDataSource {
  NumberTriviaModel getData();
  Future<void> setData(NumberTriviaModel model);
  Future<void> del();
}

const CACHE_NUMBER_TRIVIA = "CACHE_NUMBER_TRIVIA";

class NumberTriviaCacheDataSourceImpl implements NumberTriviaCacheDataSource {
  final SharedPrefs sharedPrefs;

  const NumberTriviaCacheDataSourceImpl(this.sharedPrefs);

  @override
  Future<void> del() {
    return this.sharedPrefs.delData(CACHE_NUMBER_TRIVIA);
  }

  @override
  NumberTriviaModel getData() {
    final str = this.sharedPrefs.getData(CACHE_NUMBER_TRIVIA);

    if (str == null || str == "") {
      throw NotFoundNumberTriviaException();
    }

    return NumberTriviaModel.fromJson(str);
  }

  @override
  Future<void> setData(NumberTriviaModel model) {
    return this.sharedPrefs.setData(CACHE_NUMBER_TRIVIA, model.toJson());
  }
}
