import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test text');

  test('Should be a subclass of NumberTrivia entity', () {
    /// Assert
    expect(tNumberTriviaModel, isA<NumberTrivia>());
  });

  group('from JSON', () {
    test("Should return a valid model when the JSON number is an integer", () {
      /// Arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));

      /// Act
      final result = NumberTriviaModel.fromJson(jsonMap);

      /// Assert
      expect(result, tNumberTriviaModel);
    });

    test(
        "Should return a valid model when the JSON number is regarded as a double",
        () {
      /// Arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia_double.json'));

      /// Act
      final result = NumberTriviaModel.fromJson(jsonMap);

      /// Assert
      expect(result, tNumberTriviaModel);
    });
  });

  group('from JSON', () {
    test("Should return a Json map with correct data ", () {
      /// Act
      final result = tNumberTriviaModel.toJson();

      /// Assert
      expect(result, {
        "text": "Test text",
        "number": 1,
      });
    });
  });
}
