import 'package:hive_flutter/adapters.dart';
import 'package:snap_shot/core/data_source/local_data_source/Hive/hive_boxes_names.dart';
import 'package:snap_shot/core/entites/user_entity.dart';
import 'package:snap_shot/features/home/domain/entity/product_entity.dart';

Future<void> userHiveSetup() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());
  Hive.registerAdapter(ProductEntityAdapter());

  if (!Hive.isBoxOpen(HiveBoxesNames.instance.userBox)) {
    await Hive.openBox<UserEntity>(HiveBoxesNames.instance.userBox);
  }
  if (!Hive.isBoxOpen(HiveBoxesNames.instance.productsBox)) {
    await Hive.openBox<ProductEntity>(HiveBoxesNames.instance.productsBox);
  }
}
