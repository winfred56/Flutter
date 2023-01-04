import 'package:dawurobo/core/post/domain/use_cases/create.dart';
import 'package:dawurobo/core/post/domain/use_cases/retreive.dart';

import '../../../../shared/usecase/usecase.dart';
import '../../domain/entities/post.dart';

class PostBloc{
  ///Constructor
  PostBloc({required this.createPost, required this.retrievePosts});

  final CreatePost createPost;
  final RetrievePosts retrievePosts;

  /// Create Post
  Future<String?> create(Post post) async {
    final result = await createPost(CreatePostParams(post));
    return result.fold((failure) => failure.message, (post) => null);
  }

  Future<List<Post>> retrieve() async {
    final result = await retrievePosts(NoParams());
    return result.fold((failure) => [Post.initial()], (post) => post);
  }
}