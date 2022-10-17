import '../models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource{
  /// Gets the last [NumberTriviaModel] when the user had internet access
  ///
  /// Throws [CacheException] if no cached data is available
  Future<NumberTriviaModel> getLastNumberTrivia();

  Future<void> cacheNumberTrivia(NumberTriviaModel triviaToCache);
}