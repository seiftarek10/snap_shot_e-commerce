import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:snap_shot/core/bloc/bloc_observer.dart';
import 'package:snap_shot/core/di/sl.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/firebase_options.dart';
import 'package:snap_shot/snap_shot.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://mwnmtiydejmgbtlxltzc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im13bm10aXlkZWptZ2J0bHhsdHpjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzcxOTE3OTQsImV4cCI6MjA5Mjc2Nzc5NH0.RbQtnMzn5uTbjsMPtEvNKGEkmSME35YN3rma08hhjEk',
  );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final router = AppRouter(role: Role.user);
  setupGetIt();
  Bloc.observer = MyBlocObserver();
  runApp(SnapShot(router: router.router));
}
