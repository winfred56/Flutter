import 'package:dartz/dartz.dart';
import 'package:dawurobo/shared/error/failure.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/usecase/usecase.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';

class CreatePost extends Usecase<Post, CreatePostParams> {
  /// Constructor
  CreatePost(this.repository);

  /// Repository
  PostRepository repository;

  @override
  Future<Either<Failure, Post>> call(CreatePostParams params) =>
      repository.create(params.post);
}

class CreatePostParams extends Equatable {
  /// Constructor
  const CreatePostParams(this.post);

  final Post post;

  @override
  // TODO: implement props
  List<Object?> get props => [post];
}
