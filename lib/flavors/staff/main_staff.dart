import 'package:flutter/material.dart';
import 'package:snap_shot/core/routing/app_router.dart';
import 'package:snap_shot/snap_shot.dart';

void main(List<String> args) {
  final router = AppRouter(role: Role.staff);

  runApp(SnapShot(router: router.router));
}
