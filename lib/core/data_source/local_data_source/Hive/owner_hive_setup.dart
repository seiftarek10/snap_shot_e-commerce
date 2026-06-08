import 'package:hive_flutter/adapters.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_boxes_names.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/core/models/user_model.dart';

Future<void> ownerHiveSetup() async {
  //warehoused data Boxes
  if (!Hive.isBoxOpen(HiveBoxesNames.instance.allUsersBox)) {
    await Hive.openBox<UserModel>(HiveBoxesNames.instance.allUsersBox);
  }

  if (!Hive.isBoxOpen(HiveBoxesNames.instance.allOrdersBox)) {
    await Hive.openBox<OrderModel>(HiveBoxesNames.instance.allOrdersBox);
  }

  //ids Boxes
  if (!Hive.isBoxOpen(HiveBoxesNames.instance.usersIdsBox)) {
    await Hive.openBox<String>(HiveBoxesNames.instance.usersIdsBox);
  }

  //data_versions
    if (!Hive.isBoxOpen(HiveBoxesNames.instance.dataVrsions)) {
    await Hive.openBox<String>(HiveBoxesNames.instance.dataVrsions);
  }

}
