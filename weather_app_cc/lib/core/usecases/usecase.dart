import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';

abstract class UseCase<Type, Params>{
  Future<Either<Failure, Type>> call(Params parameter);
}



class NoParams extends Equatable{

  @override
  // TODO: implement props
  List<Object?> get props => [];

}