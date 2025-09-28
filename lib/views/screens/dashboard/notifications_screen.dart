import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NotificationsScreen extends HookConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Center(
      child: Text(
        'Notifications Page',
        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
      ),
    );
  }
}