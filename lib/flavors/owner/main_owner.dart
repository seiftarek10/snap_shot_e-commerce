import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snap_shot/core/bloc/bloc_observer.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_setup.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/firebase_options.dart';
import 'package:snap_shot/snap_shot.dart';

void main(List<String> args) async {
  final router = AppRouter(role: Role.owner);
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await setupGetIt(Role.owner);
  await hiveSetup(Role.owner);
  Bloc.observer = MyBlocObserver();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown, 
  ]);
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => SnapShot(router: router.router),
    ),
  );
}
