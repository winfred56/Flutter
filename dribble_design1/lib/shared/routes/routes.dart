import 'package:flutter/cupertino.dart';

import '../../pages/campaign.dart';
import '../../pages/notifications.dart';
import '../../pages/sign_in.dart';
import '../../pages/social_media_profile_page.dart';

class Routes{
  /// Open [SignUpPage]
  static const signUp = '/sign-up';
  /// Open [NotificationsPage]
  static const notifications = '/notifications';
  /// Open [CampaignPage]
  static const campaign = '/campaign';

  static const socialMediaProfile = '/social-media-profile';

  static final Map<String, WidgetBuilder> routes = {
    Routes.signUp : (BuildContext context) => const SignIn(),
    Routes.notifications: (BuildContext context) => const Notifications(),
    Routes.campaign : (BuildContext context) => const Campaign(),
    Routes.socialMediaProfile: (BuildContext context) => const SocialMediaProfilePage(),
  };

}