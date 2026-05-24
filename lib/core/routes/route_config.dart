import 'package:bluetooh_share/feature/dashboard/dashboard_bottom_screen.dart';
import 'package:bluetooh_share/feature/onboarding/screens/onboarding_screen.dart';
import 'package:bluetooh_share/feature/onboarding/screens/prefernce_screen.dart';
import 'package:bluetooh_share/feature/receive/receive_screen.dart';
import 'package:bluetooh_share/feature/send/send_screen.dart';
import 'package:go_router/go_router.dart';

abstract final class RouteConfig {
  static const String onboarding = '/onboarding';
  static const String preferences = '/preferences';
  static const String receive = '/receive';
  static const String send = '/send';

  static GoRouter router = GoRouter(
    initialLocation: onboarding,
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        path: onboarding,
        builder: (context, state) => const OnBoardingScreen(),
      ),
      GoRoute(
        path: preferences,
        builder: (context, state) => const PrefernceScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) =>
            DashboardBottomScreen(state: state, child: child),
        routes: [
          GoRoute(path: send, builder: (context, state) => const SendScreen()),
          GoRoute(
            path: receive,
            builder: (context, state) => const ReceiveScreen(),
          ),
        ],
      ),
    ],
  );
}
