import 'package:bloc/bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:snap_shot/core/bloc/bloc_observer.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_setup.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/firebase_options.dart';
import 'package:snap_shot/snap_shot.dart';
import 'package:flutter/foundation.dart';
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final router = AppRouter(role: Role.user);
  await setupGetIt(Role.user);
  await hiveSetup(Role.user);
  Bloc.observer = MyBlocObserver();
  await dotenv.load(fileName: '.env');
  String? stripeKey = dotenv.env['STRIPE_PUBLISH_KEY'];
  if (stripeKey == null) {
    throw Exception('STRIPE_PUBLISH_KEY is missing in .env');
  }
  Stripe.publishableKey = stripeKey;
  await Stripe.instance.applySettings();
  
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder:(context)=> SnapShot(router: router.router)));
}



