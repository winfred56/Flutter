import 'package:equatable/equatable.dart';

class Failure extends Equatable{

  final List properties = const <dynamic>[];

  /// Constructor
  const Failure([List properties = const <dynamic>[]]) : super();

  @override
  // TODO: implement props
  List<Object?> get props => [properties];

}

/// General failures
class ServerFailure extends Failure{}
class CacheFailure extends Failure{}