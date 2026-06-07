import 'dart:ui';
import 'package:bluetooh_share/core/routes/route_config.dart';
import 'package:bluetooh_share/core/theme/theme_dark.dart';
import 'package:bluetooh_share/core/util/dependency_injection.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DependencyInjection.init(() => runApp(const MyApp()));

  FlutterError.onError = (FlutterErrorDetails details) {
    debugPrint(
      "\u001B[32m -------------- Flutter Error -------------- \u001B[0m",
    );
    debugPrint(details.toString());
    debugPrint(
      "\u001B[32m -------------- Flutter Close -------------- \u001B[0m",
    );
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint("\u001B[32m -------------- Dart Error -------------- \u001B[0m");
    debugPrint(error.toString());
    debugPrint(stack.toString());
    debugPrint("\u001B[32m -------------- Dart Close -------------- \u001B[0m");
    return false;
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return DependencyInjection.inject(
      MaterialApp.router(
        // showPerformanceOverlay: true,
        title: 'Local Connection',
        darkTheme: ThemeDark.darkTheme,
        themeMode: ThemeMode.dark,
        scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
        routerConfig: RouteConfig.router,
      ),
    );
  }
}
