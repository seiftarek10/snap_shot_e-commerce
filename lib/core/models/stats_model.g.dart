// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatsModelAdapter extends TypeAdapter<StatsModel> {
  @override
  final int typeId = 5;

  @override
  StatsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatsModel(
      totalUsers: fields[0] as StatsDetails,
      totalOrders: fields[1] as StatsDetails,
      totalProducts: fields[2] as int,
      revenue: fields[3] as num,
    );
  }

  @override
  void write(BinaryWriter writer, StatsModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.totalUsers)
      ..writeByte(1)
      ..write(obj.totalOrders)
      ..writeByte(2)
      ..write(obj.totalProducts)
      ..writeByte(3)
      ..write(obj.revenue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StatsDetailsAdapter extends TypeAdapter<StatsDetails> {
  @override
  final int typeId = 6;

  @override
  StatsDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatsDetails(
      total: fields[0] as int,
      monthlyHistory: (fields[1] as Map).cast<String, int>(),
    );
  }

  @override
  void write(BinaryWriter writer, StatsDetails obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.total)
      ..writeByte(1)
      ..write(obj.monthlyHistory);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatsDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
