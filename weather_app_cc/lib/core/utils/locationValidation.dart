import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

class LocationValidator{
  Either<Failure, double> validateLatitude( double lat ){
    try{
      lat = lat.toDouble();
      return Right(lat);
    } on FormatException{
      return Left(InvalidCoordinatesFailure());
    }
  }
  Either<Failure, double> validateLongitude(double lon){
    try{
      lon = lon.toDouble();
      return Right(lon);
    } on FormatException{
      return Left(InvalidCoordinatesFailure());
    }
  }
  }

class InvalidCoordinatesFailure extends Failure {}