import 'package:bluetooh_share/core/theme/app_color.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class RadorWidget extends StatelessWidget {
  final String profileImage;
  const RadorWidget({super.key, required this.profileImage});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: RippleAnimation(
        color: AppColor.primaryColor.withValues(alpha: 0.2),
        delay: const Duration(milliseconds: 450),
        repeat: true,
        minRadius: 75,
        maxRadius: 100,
        ripplesCount: 12,
        duration: const Duration(milliseconds: 12 * 450),
        child: Center(
          child: Image.asset(
            profileImage,
            height: 90,
            width: 90,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
