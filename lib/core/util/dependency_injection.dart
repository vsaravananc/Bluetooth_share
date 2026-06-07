import 'dart:io';

import 'package:bluetooh_share/core/data/sharedpreference_data.dart';
import 'package:bluetooh_share/core/service/bluetooth/bluetooth_repo.dart';
import 'package:bluetooh_share/core/service/bluetooth/bluetooth_service.dart';
import 'package:bluetooh_share/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

abstract final class DependencyInjection {
  static Future<void> init(VoidCallback call) async {
    const FlutterSecureStorage storage = FlutterSecureStorage(
      aOptions: AndroidOptions(),
    );
    getIt.registerSingleton<SharedpreferenceData>(
      SharedpreferenceData(storage),
    );
    if (Platform.isAndroid) {
      getIt.registerSingleton<BluetoothRepo>(BluetoothService());
    } else {
      getIt.registerSingleton<BluetoothRepo>(NullBluetoothService());
    }
    await getIt.allReady();
    call();
  }

  static Widget inject(Widget child) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>(
          create: (_) =>
              ProfileCubit(dataBase: getIt<SharedpreferenceData>()),
        ),
      ],
      child: child,
    );
  }
}
