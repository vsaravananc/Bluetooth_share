import 'dart:async';

import 'package:bluetooh_share/core/service/bluetooth/bluetooth_repo.dart';
import 'package:bluetooh_share/core/util/dependency_injection.dart';
import 'package:bluetooh_share/feature/receive/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class ReceiveScreen extends StatefulWidget {
  const ReceiveScreen({super.key});

  @override
  State<ReceiveScreen> createState() => _ReceiveScreenState();
}

class _ReceiveScreenState extends State<ReceiveScreen> {
  @override
  void initState() {
    unawaited(getIt<BluetoothRepo>().getBlueToothDevices());
    debugPrint("Receive Screen Init");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: ProfileWidget()));
  }
}
