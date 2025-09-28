import 'package:eldaa_admin/views/screens/auth/login_screen.dart';
import 'package:go_router/go_router.dart';

import 'views/screens/auth/create_new_password_screen.dart';
import 'views/screens/auth/forgot_password_screen.dart';
import 'views/screens/auth/verify_email_screen.dart';
import 'views/screens/dashboard/admin_management_screen.dart';
import 'views/screens/dashboard/commissions_screen.dart';
import 'views/screens/dashboard/customers_screen.dart';
import 'views/screens/dashboard/dashboard_shell.dart';
import 'views/screens/dashboard/faqs_screen.dart';
import 'views/screens/dashboard/notifications_screen.dart';
import 'views/screens/dashboard/savings_screen.dart';
import 'views/screens/dashboard/transactions_screen.dart';

class AppRoutes {
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String verifyEmail = '/verify-email';
  static const String createNewPassword = '/create-new-password';

  static const String customers = '/dashboard/customers';
  static const String transactions = '/dashboard/transactions';
  static const String commissions = '/dashboard/commissions';
  static const String savings = '/dashboard/savings';
  static const String adminManagement = '/dashboard/admin-management';
  static const String faqs = '/dashboard/faqs';
  static const String notifications = '/dashboard/notifications';
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: AppRoutes.forgotPassword,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: AppRoutes.verifyEmail,
      builder: (context, state) => const VerifyEmailScreen(),
    ),
    GoRoute(
      path: AppRoutes.createNewPassword,
      builder: (context, state) => const CreateNewPasswordScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return DashboardShell(location: state.matchedLocation, child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutes.customers,
          builder: (context, state) => const CustomersScreen(),
        ),
        GoRoute(
          path: AppRoutes.transactions,
          builder: (context, state) => const TransactionsScreen(),
        ),
        GoRoute(
          path: AppRoutes.commissions,
          builder: (context, state) => const CommissionsScreen(),
        ),
        GoRoute(
          path: AppRoutes.savings,
          builder: (context, state) => const SavingsScreen(),
        ),
        GoRoute(
          path: AppRoutes.adminManagement,
          builder: (context, state) => const AdminManagementScreen(),
        ),
        GoRoute(
          path: AppRoutes.faqs,
          builder: (context, state) => const FaqsScreen(),
        ),
        GoRoute(
          path: AppRoutes.notifications,
          builder: (context, state) => const NotificationsScreen(),
        ),
      ],
    ),
  ],
  initialLocation: AppRoutes.login,
);
