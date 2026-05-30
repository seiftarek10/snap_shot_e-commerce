// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderModelAdapter extends TypeAdapter<OrderModel> {
  @override
  final int typeId = 4;

  @override
  OrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModel(
      id: fields[1] as String,
      products: (fields[2] as List).cast<ProductModel>(),
      userData: fields[3] as UserModel?,
      createdAt: fields[4] as String,
      productsCost: fields[5] as double,
      deliveryCost: fields[6] as double,
      status: fields[7] as String,
      isPaid: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, OrderModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.products)
      ..writeByte(3)
      ..write(obj.userData)
      ..writeByte(4)
      ..write(obj.createdAt)
      ..writeByte(5)
      ..write(obj.productsCost)
      ..writeByte(6)
      ..write(obj.deliveryCost)
      ..writeByte(7)
      ..write(obj.status)
      ..writeByte(8)
      ..write(obj.isPaid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
