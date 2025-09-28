import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppButton extends HookConsumerWidget {
  final bool isOutlinedButton;
  final Function()? onPressed;
  final FontWeight fontWeight;
  final bool hasShadow;
  final double fontSize;
  final String text;
  final bool disabled;
  final EdgeInsets? padding;
  final Widget? prefix;
  final Widget? suffix;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double borderRadius;
  final bool isDanger;
  final bool alternateButton;
  const AppButton({
    this.borderRadius = 12,
    super.key,
    this.isOutlinedButton = false,
    this.hasShadow = false,
    this.fontWeight = FontWeight.w700,
    this.onPressed,
    this.fontSize = 16,
    required this.text,
    this.disabled = false,
    this.padding,
    this.prefix,
    this.suffix,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.isDanger = false,
    this.alternateButton = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius.r),
        boxShadow:
            disabled
                ? null
                : hasShadow
                ? [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.15),
                    offset: const Offset(0, 2),
                    blurRadius: 12,
                    spreadRadius: 0,
                  ),
                ]
                : null,
      ),
      child: ElevatedButton(
        onPressed: disabled ? null : onPressed,
        style: ButtonStyle(
          overlayColor: WidgetStatePropertyAll(Colors.black.withValues(alpha: 0.02)),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          ),
          padding:
              padding == null
                  ? (WidgetStateProperty.all(
                    EdgeInsets.symmetric(vertical: 12.h, horizontal: 25.w),
                  ))
                  : WidgetStateProperty.all(padding),
          side:
              isOutlinedButton
                  ? WidgetStateProperty.all(
                    BorderSide(
                      color:
                          isDanger
                              ? const Color(0xffCB051F)
                              : (borderColor ?? (disabled ? Colors.grey : Color(0xffA8A8A8))),
                      width: 1.sp,
                    ),
                  )
                  : null,
          backgroundColor: WidgetStateProperty.all(
            disabled
                ? (isOutlinedButton
                    ? Colors.transparent
                    : backgroundColor?.withValues(alpha: 0.2) ??
                        (alternateButton ? Colors.white : Color(0xffE6E6E6)))
                : (isOutlinedButton
                    ? Colors.transparent
                    : isDanger
                    ? const Color(0xffCB051F)
                    : backgroundColor ?? (alternateButton ? Color(0xffF4F4F4) : Colors.black)),
          ),
          shadowColor: WidgetStateProperty.all(Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            prefix ?? const SizedBox.shrink(),
            if (prefix != null) 10.horizontalSpace,
            Text(
              text,
              style: TextStyle(
                color:
                    disabled
                        ? alternateButton
                            ? Colors.grey
                            : Colors.grey
                        : isDanger
                        ? isOutlinedButton
                            ? const Color(0xffCB051F)
                            : Colors.white
                        : textColor ??
                            (isOutlinedButton
                                ? Colors.black
                                : alternateButton
                                ? Colors.black
                                : Colors.white),
                fontWeight: fontWeight,
                fontSize: fontSize.sp,
              ),
            ),
            if (suffix != null) 10.horizontalSpace,
            suffix ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
