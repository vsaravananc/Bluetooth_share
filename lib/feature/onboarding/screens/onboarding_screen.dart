import 'package:bluetooh_share/core/assets/images.dart';
import 'package:bluetooh_share/core/routes/route_config.dart';
import 'package:bluetooh_share/core/theme/theme_extenstin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

final List<String> onBoardingImages = [
  AppImages.searching,
  AppImages.connecting,
  AppImages.upgrading,
];

final List<String> onBoardingTexts = [
  'Your files are transferred safely with encrypted communication and uninterrupted sharing experience.',
  'Discover nearby devices using Bluetooth and establish a secure high-speed connection in seconds',
  'Share photos, videos, documents, and apps instantly with nearby devices no internet required.',
];

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void goToNextPage(int index) {
    if (index < 2) {
      pageController.nextPage(duration: 300.ms, curve: Curves.easeInOut);
    } else {
      context.go(RouteConfig.preferences);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: pageController,
          physics: const ClampingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  RepaintBoundary(
                    child: Image.asset(onBoardingImages[index])
                      .animate()
                      .fade()
                      .blurXY(begin: 20, end: 0, duration: 500.ms)
                      .scale(
                        begin: const Offset(1.1, 1.1),
                        end: const Offset(1, 1),
                        duration: 500.ms,
                      ),
                  ),
                  Text(
                    onBoardingTexts[index],
                    textAlign: TextAlign.center,
                    style: context.titleLarge,
                  ),
                  const Spacer(flex: 1),
                  RepaintBoundary(
                    child:
                        ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: context.theme.primaryColor,
                          minimumSize: const Size.fromHeight(55),
                        ),
                        onPressed: () => goToNextPage(index),
                        child: Text(
                          index < 2 ? "Next" : "Get Started",
                          style: context.titleMedium,
                        ),
                      )
                      .animate()
                      .blurXY(begin: 20, end: 0)
                      .fade()
                      .scaleX(begin: 0.8, end: 1, duration: 500.ms),
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
