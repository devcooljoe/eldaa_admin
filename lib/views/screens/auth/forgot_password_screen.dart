import 'package:eldaa_admin/router.dart';
import 'package:eldaa_admin/views/widgets/buttons.dart';
import 'package:eldaa_admin/views/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ForgotPasswordScreen extends HookConsumerWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.sp),
              child: Column(
                children: [
                  SvgPicture.asset('assets/icons/app-logo.svg'),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70.r),
                      color: Color(0xff3A3A3A),
                    ),
                    child: Opacity(
                      opacity: 0.6,
                      child: Text(
                        'Admin',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffF4F4F4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 460.w,
              padding: EdgeInsets.all(28.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  8.verticalSpace,
                  Text(
                    'Enter the email associated with your account. We will\nsend you a verification code',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff808D9E),
                    ),
                  ),
                  20.verticalSpace,
                  AppFormField(
                    padding: EdgeInsets.fromLTRB(12.w, 20.h, 12.w, 20.h),
                    hintText: 'Email Address',
                    prefixIconAsset: 'assets/icons/app-mail.svg',
                  ),
                  40.verticalSpace,
                  AppButton(
                    text: 'Continue',
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    onPressed: () {
                      context.go(AppRoutes.verifyEmail);
                    },
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            Opacity(
              opacity: 0.6,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: Text(
                  'Copyright © 2025 EldaaBank',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffC4C4C4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
