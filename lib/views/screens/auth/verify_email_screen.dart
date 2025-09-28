import 'package:eldaa_admin/router.dart';
import 'package:eldaa_admin/views/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyEmailScreen extends HookConsumerWidget {
  const VerifyEmailScreen({super.key});

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
              padding: EdgeInsets.only(top: 70.sp),
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
                    'Verify Email',
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
                  PinCodeTextField(
                    autovalidateMode: AutovalidateMode.disabled,
                    autoDismissKeyboard: true,
                    appContext: context,
                    showCursor: true,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                    ),
                    pastedTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                    ),
                    length: 6,
                    backgroundColor: Colors.transparent,
                    animationType: AnimationType.none,
                    pinTheme: PinTheme(
                      selectedFillColor: Colors.white,
                      selectedColor: Color(0xffEFEFEF),
                      inactiveFillColor: Colors.white,
                      inactiveColor: Color(0xffEFEFEF),
                      shape: PinCodeFieldShape.box,
                      borderWidth: 1,
                      activeColor: Color(0xffEFEFEF),
                      borderRadius: BorderRadius.circular(12.r),
                      fieldHeight: 52.w,
                      fieldWidth: 52.w,
                      activeFillColor: Colors.white,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    onCompleted: (value) {},
                    onChanged: (value) {},
                  ),
                  12.verticalSpace,
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(52.r),
                          color: Color(0xffE6E6E6),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/arrow-turn-forward.svg',
                              width: 16.w,
                            ),
                            8.horizontalSpace,
                            Text(
                              'Resend Code in 00:49',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff191919),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  40.verticalSpace,
                  AppButton(
                    text: 'Continue',
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    onPressed: () => context.go(AppRoutes.createNewPassword),
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
