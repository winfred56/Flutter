import 'package:dartz/dartz.dart';
import 'package:dawurobo/core/post/domain/entities/post.dart';
import 'package:dawurobo/shared/error/failure.dart';

import '../../../../shared/network/network.dart';
import '../../domain/repositories/post_repository.dart';
import '../data_sources/post_remote_database.dart';

class PostRepositoryImpl implements PostRepository {
  /// Constructor
  PostRepositoryImpl({
    required this.networkInfo,
    required this.remoteDatabase,
  });

  /// Dependencies
  NetworkInfo networkInfo;
  PostRemoteDatabase remoteDatabase;

  @override
  Future<Either<Failure, Post>> create(Post post) async {
    try {
      await networkInfo.hasInternet();
      final results = await remoteDatabase.create(post);
      return Right(results);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Post>>> retrieve() async {
    try {
      await networkInfo.hasInternet();
      final result = await remoteDatabase.retrieve();
      return Right(result);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, Post>> getSpecificPost(String documentId) async {
    try {
      await networkInfo.hasInternet();
      final result = await remoteDatabase.specificPost(documentId);
      return Right(result);
    } catch (error) {
      return Left(Failure(error.toString()));
    }
  }
}
