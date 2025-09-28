import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommissionsScreen extends HookConsumerWidget {
  const CommissionsScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Center(
      child: Text(
        'Commissions Page',
        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w600),
      ),
    );
  }
}