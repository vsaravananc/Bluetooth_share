
import 'package:bluetooh_share/feature/receive/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class ReceiveScreen extends StatelessWidget {
  const ReceiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: ProfileWidget()));
  }
}

// getIt<BluetoothRepo>().getBlueToothDevices()