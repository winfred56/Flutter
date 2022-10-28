import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

class InputValidation{
  Either<Failure, String> checkString (String str){
    try{
      final city = str.toString();
      return Right(city);
      } on FormatException{
      return Left(InvalidInputFailure());
    }
    }
}

class InvalidInputFailure extends Failure{}