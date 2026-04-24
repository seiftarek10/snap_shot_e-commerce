import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:snap_shot/core/bloc/bloc_observer.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/firebase_options.dart';
import 'package:snap_shot/snap_shot.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final router = AppRouter(role: Role.user);
  setupGetIt();
  Bloc.observer = MyBlocObserver();
  runApp(SnapShot(router: router.router));
}
