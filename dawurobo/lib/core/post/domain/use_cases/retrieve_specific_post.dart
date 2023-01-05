import 'package:dartz/dartz.dart';
import 'package:dawurobo/shared/error/failure.dart';
import 'package:dawurobo/shared/usecase/usecase.dart';

import '../entities/post.dart';
import '../repositories/post_repository.dart';

class GetSpecificPost extends Usecase<Post,StringParams>{
  /// Constructor
  GetSpecificPost(this.repository);

  PostRepository repository;

  @override
  Future<Either<Failure, Post>> call(StringParams params) => repository.getSpecificPost(params.value);

  
}