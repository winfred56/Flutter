import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/core/usecase/usecase.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'get_number_trivia_test.mocks.dart';


@GenerateMocks([NumberTriviaRepository])
void main() {

  var mockNumberTriviaRepository = MockNumberTriviaRepository();
  var tNumberTrivia = NumberTrivia(text: "text", number: 1) ;
  
  var usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);

  test('Should get trivia from the repository',
          () async
      {
        /// arrange
        when(mockNumberTriviaRepository.getRandomNumberTrivia())
            .thenAnswer((_) async => Right(tNumberTrivia));

        /// act
        final result = await usecase(NoParams());

        /// assert
        expect(result, Right(tNumberTrivia));
        verify(mockNumberTriviaRepository.getRandomNumberTrivia());
        verifyNoMoreInteractions(mockNumberTriviaRepository);

      }
  );
}