import 'package:eldaa_admin/views/widgets/touch_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppFormField extends HookWidget {
  final String hintText;
  final bool obscureText;
  final bool hasPasswordToggle;
  final Widget? suffixIcon;
  final String? prefixIconAsset;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Function()? onTap;
  final double? fontSize;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool hasBorder;
  final Color? borderColor;
  final double? borderWidth;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final List<TextInputFormatter>? formatter;
  final FontWeight? fontWeight;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final BorderRadius? borderRadius;
  final Color? hintColor;
  final Color? textColor;

  const AppFormField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.hasPasswordToggle = false,
    this.suffixIcon,
    this.readOnly = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.onTap,
    this.maxLength,
    this.fontSize,
    this.keyboardType,
    this.textAlign,
    this.controller,
    this.onChanged,
    this.validator,
    this.hasBorder = false,
    this.borderColor,
    this.borderWidth,
    this.padding,
    this.prefixIconAsset,
    this.backgroundColor,
    this.formatter,
    this.fontWeight,
    this.focusNode,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.borderRadius,
    this.hintColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveController = controller ?? useTextEditingController();
    final effectiveFocusNode = focusNode ?? useFocusNode();
    final isObscure = useState(obscureText);
    final hasFocus = useState(false);

    useEffect(() {
      void listener() =>
          hasFocus.value =
              effectiveFocusNode.hasFocus ||
              effectiveController.text.isNotEmpty;

      effectiveFocusNode.addListener(listener);
      effectiveController.addListener(listener);

      return () {
        effectiveFocusNode.removeListener(listener);
        effectiveController.removeListener(listener);
      };
    }, [effectiveFocusNode, effectiveController]);

    const Duration animDuration = Duration(milliseconds: 200);

    return SizedBox(
      child: Stack(
        children: [
          TextFormField(
            autocorrect: false,
            controller: effectiveController,
            focusNode: effectiveFocusNode,
            buildCounter:
                (
                  context, {
                  required currentLength,
                  required isFocused,
                  maxLength,
                }) => null,
            autovalidateMode: autovalidateMode,
            inputFormatters: formatter,
            cursorColor: Colors.black,
            validator: validator,
            style: TextStyle(
              fontSize: fontSize ?? 16.sp,
              fontWeight: fontWeight ?? FontWeight.w600,
              color: textColor ?? Color(0xff191919),
            ),
            maxLength: maxLength,
            keyboardType: keyboardType,
            readOnly: readOnly,
            onTap: onTap,
            obscureText: hasPasswordToggle ? isObscure.value : obscureText,
            maxLines: maxLines,
            minLines: minLines,
            textAlign: textAlign ?? TextAlign.left,
            onChanged: onChanged,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              isDense: true,
              suffixIcon:
                  hasPasswordToggle
                      ? Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.sp),
                        child: TouchOpacity(
                          onTap: () => isObscure.value = !isObscure.value,
                          child: SvgPicture.asset(
                            isObscure.value
                                ? 'assets/icons/eye-off.svg'
                                : 'assets/icons/eye.svg',
                            width: 18.w,
                          ),
                        ),
                      )
                      : suffixIcon,

              border: OutlineInputBorder(
                borderSide:
                    hasBorder
                        ? BorderSide(
                          color: borderColor ?? Color(0xffA8A8A8),
                          width: borderWidth ?? 0.5.sp,
                        )
                        : BorderSide.none,
                borderRadius: borderRadius ?? BorderRadius.circular(16.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    hasBorder
                        ? BorderSide(
                          color: borderColor ?? Color(0xffA8A8A8),
                          width: borderWidth ?? 0.5.sp,
                        )
                        : BorderSide.none,
                borderRadius: borderRadius ?? BorderRadius.circular(12.r),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: borderWidth ?? 0.5.sp,
                ),
                borderRadius: borderRadius ?? BorderRadius.circular(12.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? Color(0xffA8A8A8),
                  width: borderWidth ?? 0.5.sp,
                ),
                borderRadius: borderRadius ?? BorderRadius.circular(12.r),
              ),
              fillColor:
                  backgroundColor ??
                  (hasFocus.value ? Colors.white : const Color(0xffE6E6E6)),
              filled: true,
              contentPadding:
                  padding ?? EdgeInsets.fromLTRB(12.w, 20.h, 12.w, 10.h),
            ),
          ),
          AnimatedPositioned(
            duration: animDuration,
            top: hasFocus.value ? 6.h : 17.h,
            left: hasFocus.value ? 12.w : 12.w,
            curve: Curves.ease,
            child: GestureDetector(
              onTap: () => effectiveFocusNode.requestFocus(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (prefixIconAsset != null)
                    SvgPicture.asset(
                      prefixIconAsset!,
                      width: hasFocus.value ? 12.w : 20.w,
                    ),
                  if (prefixIconAsset != null)
                    hasFocus.value ? 4.horizontalSpace : 8.horizontalSpace,
                  Text(
                    hintText,
                    style: TextStyle(
                      color:
                          hasFocus.value
                              ? Color(0xffA8A8A8)
                              : (hintColor ?? Color(0xff515151)),
                      fontSize: hasFocus.value ? 10 : 14.sp,
                      fontWeight:
                          hasFocus.value
                              ? FontWeight.w400
                              : fontWeight ?? FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
