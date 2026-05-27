import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bluetooh_share/core/data/abstract_data.dart';
import 'package:bluetooh_share/core/util/app_constant.dart';
import 'package:flutter/foundation.dart';

class ProfileCubit extends Cubit<int> {
  final AbstractDataBase dataBase;
  ProfileCubit({required this.dataBase}) : super(0);
  void onTap(int i) {
    emit(i);
    unawaited(dataBase.set<int>(USER_PROFILE_IMAGE, i));
    if (kDebugMode) {
      debugPrint("\u001B[32mSaved Image Index: $i\u001B[0m");
    }
  }
}
