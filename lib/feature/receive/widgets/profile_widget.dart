import 'package:bluetooh_share/core/helper/random_dot.dart';
import 'package:bluetooh_share/core/service/bluetooth/bluetooth_repo.dart';
import 'package:bluetooh_share/core/util/dependency_injection.dart';
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
        return FutureBuilder(
          future: getIt<BluetoothRepo>().getBlueToothDevices(),
          builder: (context, asyncSnapshot) {
            return Stack(
              children: [
                SizedBox(
                  width: .infinity,
                  height: 300,
                  child: RadorWidget(
                    profileImage: profileImage,
                    key: ValueKey(profileImage),
                  ),
                ),

                if (asyncSnapshot.hasData && asyncSnapshot.data != null)
                  ...asyncSnapshot.data!.map((e) {
                    final Offset offset = getRandomOffsets();
                    return Positioned(
                      left: offset.dx,
                      top: offset.dy,
                      child: GestureDetector(
                        onTap: (){
                          print(e.name);
                        },
                        child: Container(
                          padding: const .all(8),
                          decoration: BoxDecoration(
                            shape: .circle,
                            color: Colors.amber[100],
                          ),
                          child: Text(
                            e.name[0].toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
              ],
            );
          }
        );
      },
    );
  }
}
