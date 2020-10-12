import 'dart:convert';

import 'package:tdd_example/core/exceptions/exceptions.dart';
import 'package:tdd_example/features/number_trivia/domain/models/number_trivia_model.dart';
import "package:http/http.dart";

abstract class NumberTriviaApiDataSource {
  Future<NumberTriviaModel> getRandomNumbertrivia();
  Future<NumberTriviaModel> getNumberTriviaByNumber(int number);
}

class NumberTriviaApiDataSourceImpl implements NumberTriviaApiDataSource {
  final Client _client;

  const NumberTriviaApiDataSourceImpl(this._client);

  @override
  Future<NumberTriviaModel> getNumberTriviaByNumber(int number) async {
    Map<String, dynamic> json =
        await this._getJson("http://numbersapi.com/$number?json");

    return NumberTriviaModel.fromMap(json);
  }

  @override
  Future<NumberTriviaModel> getRandomNumbertrivia() async {
    // DRY
    Map<String, dynamic> json =
        await this._getJson("http://numbersapi.com/random?json");

    return NumberTriviaModel.fromMap(json);
  }

  Future<dynamic> _getJson(String url) async {
    final response = await this._client.get(url);

    if (response.statusCode != 200) {
      throw NumberTriviaServerException();
    }

    return jsonDecode(response.body);
  }
}
