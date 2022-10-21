import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{
  final List properties = const <dynamic>[];

  const Failure([List properties = const <dynamic>[]]) : super();

  @override
  List get props => [properties];
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}