import 'package:hive_flutter/adapters.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_boxes_names.dart';
import 'package:snap_shot/core/models/user_model.dart';
import 'package:snap_shot/core/models/product_model.dart';

Future<void> userHiveSetup() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());
  if (!Hive.isBoxOpen(HiveBoxesNames.instance.userBox)) {
    await Hive.openBox<UserModel>(HiveBoxesNames.instance.userBox);
  }
  // await Hive.deleteBoxFromDisk(HiveBoxesNames.instance.productsBox);
  // await Hive.deleteBoxFromDisk(HiveBoxesNames.instance.favProductsBox);
  // await Hive.deleteBoxFromDisk(HiveBoxesNames.instance.cartProdcutBox);
  if (!Hive.isBoxOpen(HiveBoxesNames.instance.productsBox)) {
    await Hive.openBox<ProductModel>(HiveBoxesNames.instance.productsBox);
  }
  if (!Hive.isBoxOpen(HiveBoxesNames.instance.favProductsBox)) {
    await Hive.openBox<ProductModel>(HiveBoxesNames.instance.favProductsBox);
  }
  if (!Hive.isBoxOpen(HiveBoxesNames.instance.cartProdcutBox)) {
    await Hive.openBox<ProductModel>(HiveBoxesNames.instance.cartProdcutBox);
  }
}
