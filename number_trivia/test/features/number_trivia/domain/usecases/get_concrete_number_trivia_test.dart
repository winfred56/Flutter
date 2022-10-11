import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_tivia.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

void main() {
  // variables to hold data from the classes
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;
  
  setUp(() {
    // Instance of MockNumberTriviaRepository
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    // Instance of GetConcreteNumberTrivia
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  // test number
  final tNumber = 1;
  // test NumberTrivia
  final tNumberTrivia = NumberTrivia(text: "text", number: tNumber);

  test(
    'Should get the trivia for number from the repository',
    () async{
      // Arrange
      // Provide functionality to the Instance of MockNumberTriviaRepository (mockNumberTriviaRepository)
      when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
          .thenAnswer((_) async => Right(tNumberTrivia));
      // Act
      final result = await usecase.execute(number:tNumber);
      // Assert
      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
  },
  );
}