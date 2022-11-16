import 'package:equatable/equatable.dart';

class Failure extends Equatable{
  /// Failure Constructor
  const Failure( this.message);

  /// Error/Failure message
  final String message;

  @override
  // TODO: implement props
  List<Object?> get props => [message];

}