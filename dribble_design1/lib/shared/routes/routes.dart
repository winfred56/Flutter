import 'package:flutter/cupertino.dart';

import '../../pages/campaign.dart';
import '../../pages/notifications.dart';
import '../../pages/sign_up.dart';

class Routes{
  /// Open [SignUpPage]
  static const signUp = '/sign-up';
  /// Open [NotificationsPage]
  static const notifications = '/notifications';
  /// Open [CampaignPage]
  static const campaign = '/campaign';

  static final Map<String, WidgetBuilder> routes = {
    Routes.signUp : (BuildContext context) => const SignIn(),
    Routes.notifications: (BuildContext context) => const Notifications(),
    Routes.campaign : (BuildContext context) => const Campaign()
  };

}