import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

/// Blue print for all usecases in the app
/// Mainly for usecases uses [Either]
abstract class Usecase<Type, Params> {
  /// Contract call method
  Future<Either<Failure, Type>> call(Params params);
}

/// Used when usecases doesn't take any parameters
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

/// Used for token/string value required usecases
class StringParams<Type> extends Equatable {
  /// Constructor
  const StringParams(this.value);

  /// Authorization token
  /// OR
  /// A single value parameter
  final Type value;

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

/// Used for list of strings value required usecase
class ListStringParams extends Equatable {
  /// Constructor
  const ListStringParams(this.values);

  /// Document ids for firestore
  /// OR
  /// List of String value parameter
  final List<String> values;

  @override
  List<Object> get props => [values];
}
