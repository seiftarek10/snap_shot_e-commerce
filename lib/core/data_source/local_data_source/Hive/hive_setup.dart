import 'package:hive_flutter/adapters.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_boxes_names.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/owner_hive_setup.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/user_hive_setup.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/core/models/product_model.dart';
import 'package:snap_shot/core/routing/app_router.dart';

Future<void> hiveSetup(Role role) async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(OrderModelAdapter());

  //warehoused data Boxes
  if (!Hive.isBoxOpen(HiveBoxesNames.instance.productsBox)) {
    await Hive.openBox<ProductModel>(HiveBoxesNames.instance.productsBox);
  }

  if (!Hive.isBoxOpen(HiveBoxesNames.instance.firstTimeBox)) {
    await Hive.openBox<bool>(HiveBoxesNames.instance.firstTimeBox);
  }

  if (role == Role.user) {
    await userHiveSetup();
  }
  if (role == Role.owner) {
    await ownerHiveSetup();
  }
}
