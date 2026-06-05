import 'package:bluetooh_share/core/theme/app_color.dart';
import 'package:bluetooh_share/cubit/profile_cubit.dart';
import 'package:bluetooh_share/feature/onboarding/widgets/image_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, int>(
      builder: (context, state) {
        return RepaintBoundary(
          child: RippleAnimation(
            color: AppColor.primaryColor.withValues(alpha: 0.2),
            delay: const Duration(milliseconds: 450),
            repeat: true,
            minRadius: 75,
            maxRadius: 100,
            ripplesCount: 12,
            duration: const Duration(milliseconds: 12 * 300),
            child: Image.asset(
              personImageOptions[state],
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
