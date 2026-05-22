import 'dart:async';
import 'package:bluetooh_share/core/assets/images.dart';
import 'package:bluetooh_share/core/service/bluetooth_repo.dart';
import 'package:bluetooh_share/core/theme/theme_extenstin.dart';
import 'package:bluetooh_share/core/util/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class DashboardBottomScreen extends StatefulWidget {
  final Widget child;
  final GoRouterState state;
  const DashboardBottomScreen({
    super.key,
    required this.child,
    required this.state,
  });

  @override
  State<DashboardBottomScreen> createState() => _DashboardBottomScreenState();
}

class _DashboardBottomScreenState extends State<DashboardBottomScreen> {
  @override
  void initState() {
    unawaited(checkAndRequestBluetooth());
    super.initState();
  }

  Future<void> checkAndRequestBluetooth() async {
    final bluetoothStatus = await getIt<BluetoothRepo>().statusOfBlueTooth();
    if (bluetoothStatus == null) return;
    if (!bluetoothStatus && mounted) {
      showModalBottomSheet(
        sheetAnimationStyle: const AnimationStyle(curve: Curves.bounceIn),
        backgroundColor: context.theme.cardColor,
        requestFocus: true,
        useSafeArea: true,
        enableDrag: false,
        elevation: 2,
        context: context,
        builder: (bottomContext) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 180,
                  child: Image.asset(
                    AppImages.permission,
                    fit: BoxFit.fitHeight,
                    cacheHeight: 210,
                  ),
                ),
                Text(
                  "Nearby devices Permission Required",
                  style: context.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  'Please allow Bluetooth access to connect with nearby devices and provide a seamless experience.',
                  style: context.titleSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
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
                      onPressed: () async {
                        final requestResponse = await getIt<BluetoothRepo>()
                            .requestPermission();
                        if (requestResponse == null) return;
                        if (requestResponse && bottomContext.mounted) {
                          bottomContext.pop();
                        }
                      },
                      child: Text(
                        "Approve Permission",
                        style: context.titleMedium,
                      ),
                    )
                    .animate()
                    .blurXY(begin: 20, end: 0)
                    .fade()
                    .scaleX(begin: 0.8, end: 1, duration: 500.ms),
              ],
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          if (value == 0) {
            context.go("/send");
          } else {
            context.go("/receive");
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedUpload01),
            label: "Send",
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedDownload01),
            label: "Receive",
          ),
        ],
      ),
    );
  }
}
