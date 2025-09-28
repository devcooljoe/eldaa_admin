import 'package:eldaa_admin/router.dart';
import 'package:eldaa_admin/views/widgets/touch_opacity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardShell extends HookConsumerWidget {
  final Widget child;
  final String location;

  const DashboardShell({
    super.key,
    required this.child,
    required this.location,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    final sidebarAnimation = useAnimation(
      Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
      ),
    );
    final isSidebarVisible = useState(true);

    void toggleSidebar() {
      isSidebarVisible.value = !isSidebarVisible.value;
      if (isSidebarVisible.value) {
        animationController.reverse();
      } else {
        animationController.forward();
      }
    }

    Widget buildMenuItem(
      String title,
      String iconPath,
      String route, {
      String? badge,
    }) {
      final isActive = location == route;

      return Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isActive ? Colors.grey[800] : Colors.transparent,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
          visualDensity: VisualDensity.compact,
          dense: true,
          leading: SvgPicture.asset(
            iconPath,
            width: 20.w,
            colorFilter: ColorFilter.mode(
              isActive ? Colors.white : Colors.grey[400]!,
              BlendMode.srcIn,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.grey[400],
              fontSize: 16.sp,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
          trailing:
              badge != null
                  ? Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      badge,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                  : null,
          onTap: () => context.go(route),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xfff7f7f7),
      body: Row(
        children: [
          // Sidebar
          SizedBox(
            width: 250.w * (1 - sidebarAnimation),
            child: Transform.translate(
              offset: Offset(-250.w * sidebarAnimation, 0),
              child: Container(
                width: 250.w,
                color: Colors.black,
                child: Column(
                  children: [
                    // Logo
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.w,
                        vertical: 16.h,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/app-logo.svg',
                            width: 120.w,
                          ),
                        ],
                      ),
                    ),
                    18.verticalSpace,

                    // Menu Items
                    buildMenuItem(
                      'Customers',
                      'assets/icons/customer.svg',
                      AppRoutes.customers,
                    ),
                    buildMenuItem(
                      'Transactions',
                      'assets/icons/transaction.svg',
                      AppRoutes.transactions,
                      badge: '10',
                    ),
                    buildMenuItem(
                      'Commissions',
                      'assets/icons/commision.svg',
                      AppRoutes.commissions,
                    ),
                    buildMenuItem(
                      'Savings',
                      'assets/icons/saving.svg',
                      AppRoutes.savings,
                    ),
                    buildMenuItem(
                      'Admin Management',
                      'assets/icons/admin-management.svg',
                      AppRoutes.adminManagement,
                    ),
                    buildMenuItem(
                      'FAQs',
                      'assets/icons/faq.svg',
                      AppRoutes.faqs,
                    ),
                    buildMenuItem(
                      'Notifications',
                      'assets/icons/notification.svg',
                      AppRoutes.notifications,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Main Content
          Expanded(
            child: Column(
              children: [
                // Header
                Container(
                  height: 56.h,
                  padding: EdgeInsets.fromLTRB(24.w, 0, 28.w, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(color: Color(0xfff0f2f5)),
                    ),
                  ),
                  child: Row(
                    children: [
                      TouchOpacity(
                        onTap: toggleSidebar,
                        child: Icon(Icons.menu, size: 28.w),
                      ),
                      Spacer(),
                      Text(
                        'Log In Date/Time: 7th Oct 2022 - 2:45PM',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          height: 1.57,
                          color: Color(0xff667185),
                        ),
                      ),
                      52.horizontalSpace,
                      TouchOpacity(
                        onTap: () => context.go(AppRoutes.login),
                        child: Text(
                          'Log out',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            height: 1.29,
                            color: Color(0xffdd524d),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Content
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
