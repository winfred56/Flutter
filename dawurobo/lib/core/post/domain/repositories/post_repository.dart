import 'package:dartz/dartz.dart';

import '../../../../shared/error/failure.dart';
import '../entities/post.dart';

abstract class PostRepository{
  /// Create [Post]
  Future<Either<Failure,Post>> create(Post post);

  /// Retrieve all [Post]
  Future<Either<Failure,List<Post>>> retrieve();
}