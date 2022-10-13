import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_tivia.dart';
import 'package:mockito/annotations.dart';
import './get_number_trivia_test.mocks.dart';

@GenerateMocks([NumberTriviaRepository])

void main() {
  var mockNumberTriviaRepository = MockNumberTriviaRepository();

  var tNumber = 1;
  var tNumberTrivia = NumberTrivia(text: "text", number: tNumber);

  var usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);

  test(
      'Should get the trivia for number from the repository',
  () async{
    // Arrange
    // Provide functionality to the Instance of MockNumberTriviaRepository (mockNumberTriviaRepository)
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));
    // Act
    final result = await usecase(Params(number: tNumber));
    // Assert
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}