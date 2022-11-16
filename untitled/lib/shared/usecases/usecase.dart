import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

/// Blue print for all usecases in the app
abstract class Usecase<Type, Params>{
  /// Construct to call
  Future<Either<Failure, Type>> call(Params params);

}

/// Used when usecases doesn't take any parameters
class NoParams extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

/// Used for token/string value required usecases
class StringParams extends Equatable{
  /// Constructor
  const StringParams(this.value);

  ///A single value parameter
  final String value;

  @override
  // TODO: implement props
  List<Object?> get props => [value];

}