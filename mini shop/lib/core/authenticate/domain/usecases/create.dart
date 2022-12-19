import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mini_shop/shared/error/failure.dart';

import '../../../../shared/usecase/usecase.dart';
import '../repositories/authentication_repository.dart';

class Create extends Usecase<void, CreateParams> {
  /// Constructor
  Create(this.repository);

  AuthenticationRepository repository;

  @override
  Future<Either<Failure, void>> call(params) =>
      repository.create(params.email, params.password);

}

class CreateParams extends Equatable {
  /// Constructor
  const CreateParams(this.email, this.password);

  /// Parameter fields
  final String email;
  final String password;

  @override
  // TODO: implement props
  List<Object?> get props => [email, password];

}