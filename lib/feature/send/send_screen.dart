import 'package:bluetooh_share/core/service/bluetooth/bluetooth_repo.dart';
import 'package:bluetooh_share/core/util/dependency_injection.dart';
import 'package:flutter/material.dart';

class SendScreen extends StatelessWidget {
  const SendScreen({super.key});

  static void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Kindly check your Bluetooth is turned on and try again"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            getIt<BluetoothRepo>().startLookingNewDevice();
              
          },
          child: const Text("Send Screen"),
        ),
      ),
    );
  }
}
