import 'package:flutter/material.dart';

import '../common/data/models/notification.dart';
import '../common/resources.dart';
import '../common/widgets/top_bar.dart';
import 'notification_item.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBar(title: 'NOTIFICATIONS'),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppPadding.normal),
        separatorBuilder: (_, __) => const SizedBox(height: AppPadding.normal),
        itemBuilder: (_, index) => NotificationItem(testNotifications[index]),
        itemCount: testNotifications.length,
      ),
    );
  }
}
