import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import '../../../../shared/data/image_assets.dart';
import '../../../../shared/extensions/extentions.dart';
import '../../domain/entities/user.dart';
import '../logic/user_logic.dart';

class ProfilePicture extends StatelessWidget with UserLogic {
  ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FutureBuilder<User>(
        future: bloc.getAuthenticatedUser(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            return Column(children: [
              Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(150),
                          border: Border.all(
                              width: 6,
                              color: theme.colorScheme.primary)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(150),
                          child: CachedNetworkImage(
                              imageUrl: snapshot.requireData.photo,
                              placeholder: (context, url) => const Image(image: AssetImage(ImageAssets.googleImage)),
                              errorWidget: (context, url, error) => const Icon(Icons.error),
                              fit: BoxFit.cover,
                              width: 150,
                              height: 150)).center())
                  .center(),
              Text('@${snapshot.requireData.username}',
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.black54))
                  .padT(10)
            ]).padB(20);
          } else {
            return Container();
          }
        });
  }
}
