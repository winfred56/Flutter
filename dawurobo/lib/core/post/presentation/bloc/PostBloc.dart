import 'package:dawurobo/core/post/domain/use_cases/create.dart';
import 'package:dawurobo/core/post/domain/use_cases/retreive.dart';

import '../../../../shared/usecase/usecase.dart';
import '../../domain/entities/post.dart';
import '../../domain/use_cases/retrieve_specific_post.dart';

class PostBloc {
  ///Constructor
  PostBloc({required this.createPost, required this.retrievePosts, required this.specificPost});

  final CreatePost createPost;
  final RetrievePosts retrievePosts;
  final GetSpecificPost specificPost;




  /// Create [Post]
  Future<String?> create(Post post) async {
    final result = await createPost(CreatePostParams(post));
    return result.fold((failure) => failure.message, (post) => null);
  }

  /// Get all [Post]s
  Future<List<Post>> retrieve() async {
    final result = await retrievePosts(NoParams());
    return result.fold((failure) => [Post.initial()], (post) => post);
  }

  /// Get a specific [Post]
  Future<Post> getSpecificPost(String documentId) async {
    final result = await specificPost(StringParams(documentId));
    return result.fold((failure) => Post.initial(), (post) => post);
  }
}
