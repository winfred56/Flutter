
import 'package:dartz/dartz.dart';

import '../error/Failures.dart';

class InputConverter{
  Either<Failure, int> stringToUnsignedInteger(String str){
    try {
      final integer = int.parse(str);
      if (integer < 0) throw FormatException();
      return Right(integer);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {}