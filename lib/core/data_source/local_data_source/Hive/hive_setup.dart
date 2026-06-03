import 'package:hive_flutter/adapters.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_boxes_names.dart';
import 'package:snap_shot/core/models/order_model.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/core/models/product_model.dart';

Future<void> userHiveSetup() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());
  Hive.registerAdapter(OrderModelAdapter());
  //warehoused data Boxes
  if (!Hive.isBoxOpen(HiveBoxesNames.instance.userBox)) {
    await Hive.openBox<UserModel>(HiveBoxesNames.instance.userBox);
  }
  if (!Hive.isBoxOpen(HiveBoxesNames.instance.allUsersBox)) {
    await Hive.openBox<UserModel>(HiveBoxesNames.instance.allUsersBox);
  }
  if (!Hive.isBoxOpen(HiveBoxesNames.instance.productsBox)) {
    await Hive.openBox<ProductModel>(HiveBoxesNames.instance.productsBox);
  }
  if (!Hive.isBoxOpen(HiveBoxesNames.instance.favProductsBox)) {
    await Hive.openBox<ProductModel>(HiveBoxesNames.instance.favProductsBox);
  }
  if (!Hive.isBoxOpen(HiveBoxesNames.instance.cartProdcutBox)) {
    await Hive.openBox<ProductModel>(HiveBoxesNames.instance.cartProdcutBox);
  }
  if (!Hive.isBoxOpen(HiveBoxesNames.instance.ordersBox)) {
    await Hive.openBox<OrderModel>(HiveBoxesNames.instance.ordersBox);
  }
  if (!Hive.isBoxOpen(HiveBoxesNames.instance.firstTimeBox)) {
    await Hive.openBox<bool>(HiveBoxesNames.instance.firstTimeBox);
  }

  //ids Boxes
  if (!Hive.isBoxOpen(HiveBoxesNames.instance.usersIdsBox)) {
    await Hive.openBox<bool>(HiveBoxesNames.instance.usersIdsBox);
  }
}
