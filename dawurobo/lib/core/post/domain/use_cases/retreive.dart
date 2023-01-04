import 'package:dartz/dartz.dart';
import 'package:dawurobo/core/post/domain/repositories/post_repository.dart';
import 'package:dawurobo/shared/error/failure.dart';
import 'package:dawurobo/shared/usecase/usecase.dart';

import '../entities/post.dart';

class RetrievePosts extends Usecase<List<Post>, NoParams>{
  /// Constructor
  RetrievePosts(this.repository);

  PostRepository repository;
  @override
  Future<Either<Failure, List<Post>>> call(NoParams params) => repository.retrieve();

}