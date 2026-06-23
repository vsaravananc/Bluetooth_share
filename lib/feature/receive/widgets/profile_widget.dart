import 'package:bluetooh_share/cubit/profile_cubit.dart';
import 'package:bluetooh_share/feature/onboarding/widgets/image_select.dart';
import 'package:bluetooh_share/feature/receive/widgets/rador_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, int>(
      builder: (context, state) {
        String profileImage = personImageOptions[state];
        return SizedBox(
                  width: .infinity,
                  height: 300,
                  child: RadorWidget(
                    profileImage: profileImage,
                    key: ValueKey(profileImage),
          ),
        );
      },
    );
  }
}
