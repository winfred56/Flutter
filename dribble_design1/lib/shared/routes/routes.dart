import 'package:dribble_design1/pages/account.dart';
import 'package:dribble_design1/pages/otp_verification.dart';
import 'package:flutter/cupertino.dart';

import '../../pages/campaign.dart';
import '../../pages/edit_personal_info_page.dart';
import '../../pages/notifications.dart';
import '../../pages/settings_page.dart';
import '../../pages/sign_in.dart';
import '../../pages/social_media_profile_page.dart';

class Routes{
  /// Open [SignUpPage]
  static const signUp = '/sign-up';
  /// Open [NotificationsPage]
  static const notifications = '/notifications';
  /// Open [CampaignPage]
  static const campaign = '/campaign';
  /// Open [Accountpage]
  static const account = '/account';
  /// Open [SocialMediaProfilePage]
  static const socialMediaProfile = '/social-media-profile';
  /// Open [SettingsPage]
  static const settings = '/settings';
  /// Open [EditPersonalInfo]
  static const editPersonalInfo = '/edit_personal_info';
  /// Open [OTPVerification]
  static const otpVerification = '/otp_verification';

  static final Map<String, WidgetBuilder> routes = {
    Routes.signUp : (BuildContext context) => const SignIn(),
    Routes.notifications: (BuildContext context) => const Notifications(),
    Routes.campaign : (BuildContext context) => const Campaign(),
    Routes.socialMediaProfile: (BuildContext context) => const SocialMediaProfilePage(),
    Routes.account : (BuildContext context) => const Account(),
    Routes.settings : (BuildContext context) => const SettingsPage(),
    Routes.editPersonalInfo : (BuildContext context) => const EditPersonalInfo(),
    Routes.otpVerification : (BuildContext context) => const OTPVerification(),
  };

}