import 'package:flutter/material.dart';

import '../../../../shared/extensions/extentions.dart';

class ProfileDetail extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;
  final bool navigate;

  // No Tap feature
  const ProfileDetail({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    navigate,
  }) : navigate = navigate ?? false;

  // Add a tap feature
  factory ProfileDetail.withTap(
      String title, IconData icon, VoidCallback onTap) {
    return ProfileDetail(title: title, icon: icon, onTap: onTap);
  }

  // Add a navigation feature
  factory ProfileDetail.withNavigation(
      String title, IconData icon, VoidCallback onTap) {
    return ProfileDetail(
        title: title, icon: icon, onTap: onTap, navigate: true);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            shadowColor: Colors.grey.withOpacity(0.2),
            child: ListTile(
                leading: Icon(icon),
                title: Text(title),
                minLeadingWidth: 20,
                onTap: onTap,
                trailing: navigate
                    ? const Icon(Icons.arrow_forward_ios, size: 20)
                    : null))
        .padB(10);
  }
}
