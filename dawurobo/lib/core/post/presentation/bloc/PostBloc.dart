import 'package:dawurobo/core/post/domain/use_cases/create.dart';

import '../../domain/entities/post.dart';

class PostBloc{
  ///Constructor
  PostBloc({required this.createPost});

  final CreatePost createPost;

  /// Create Post
  Future<String?> create(Post post) async {
    final result = await createPost(CreatePostParams(post));
    return result.fold((failure) => failure.message, (post) => null);
  }
}