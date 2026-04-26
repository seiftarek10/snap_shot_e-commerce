import 'package:hive_flutter/adapters.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_boxes_names.dart';
import 'package:snap_shot/core/entites/user_entity.dart';

Future<void> userHiveSetup() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());

  if (!Hive.isBoxOpen(HiveBoxesNames.userBox)) {
    await Hive.openBox<UserEntity>(HiveBoxesNames.userBox);
  }
}
