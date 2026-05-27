import 'package:bluetooh_share/core/assets/images.dart';
import 'package:bluetooh_share/core/theme/app_color.dart';
import 'package:bluetooh_share/core/theme/theme_extenstin.dart';
import 'package:bluetooh_share/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

final List<String> personImageOptions = [
  AppImages.person1,
  AppImages.person2,
  AppImages.person3,
  AppImages.person4,
  AppImages.person5,
];

class ImageSelect extends StatelessWidget {
  const ImageSelect({super.key});

  static Future<void> chooseImage(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      enableDrag: true,
      useSafeArea: true,
      builder: (bottomContext) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            spacing: 20,
            children: [
              Text(
                "Select Your Profile Image",
                style: bottomContext.titleLarge,
              ),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: personImageOptions.length,
                itemBuilder: (gridContext, index) {
                  return BlocBuilder<ProfileCubit, int>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          context.read<ProfileCubit>().onTap(index);
                          Navigator.pop(bottomContext);
                        },
                        child: Image.asset(
                          personImageOptions[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 180,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColor.borderColor, width: 2),
          ),
          child: BlocBuilder<ProfileCubit, int>(
            builder: (context, state) {
              return Image.asset(personImageOptions[state], fit: BoxFit.cover);
            },
          ),
        ),
        Positioned(
          bottom: 5,
          right: 5,
          child: GestureDetector(
            onTap: () {
              chooseImage(context);
            },
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: AppColor.primaryColor,
              child: HugeIcon(icon: HugeIcons.strokeRoundedEdit02),
            ),
          ),
        ),
      ],
    );
  }
}
