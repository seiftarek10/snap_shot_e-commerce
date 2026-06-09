import 'package:hive_flutter/adapters.dart';
import 'package:snap_shot/features/owner_home/domain/entites/stats_entity.dart';

part 'stats_model.g.dart';

@HiveType(typeId: 5)
class StatsModel {
  @HiveField(0)
  final StatsDetails totalUsers;
  @HiveField(1)
  final StatsDetails totalOrders;
  @HiveField(2)
  final int totalProducts;
  @HiveField(3)
  final num revenue;

  StatsModel({
    required this.totalUsers,
    required this.totalOrders,
    required this.totalProducts,
    required this.revenue,
  });

  StatsModel copyWith({
    StatsDetails? totalUsers,
    StatsDetails? totalOrders,
    int? totalProducts,
    num? revenue,
  }) {
    return StatsModel(
      totalUsers: totalUsers ?? this.totalUsers,
      totalOrders: totalOrders ?? this.totalOrders,
      totalProducts: totalProducts ?? 0,
      revenue: revenue ?? this.revenue,
    );
  }

  factory StatsModel.fromJson(Map<String, dynamic> json) {
    return StatsModel(
      totalUsers: StatsDetails.fromJson(json['totalUsers']),
      totalOrders: StatsDetails.fromJson(json['totalOrders']),
      totalProducts: json['totalProducts'] ?? 0,
      revenue: json['revenue'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "totalUsers": totalUsers.toJson(),
      "totalOrders": totalOrders.toJson(),
      "totalProducts": totalProducts,
      "revenue": revenue,
    };
  }

  StatsEntity toEntity() {
    return StatsEntity(
      totalUsers: totalUsers.toEntity(),
      totalOrders: totalOrders.toEntity(),
      totalProducts: totalProducts,
      revenue: revenue,
    );
  }
}

@HiveType(typeId: 6)
class StatsDetails {
  @HiveField(0)
  final int total;

  @HiveField(1)
  final Map<String, int> monthlyHistory;

  StatsDetails({required this.total, required this.monthlyHistory});

  factory StatsDetails.fromJson(Map<String, dynamic> json) {
    return StatsDetails(
      total: json['total'] ?? 0,
      monthlyHistory: Map<String, int>.from(json['monthlyHistory'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {"total": total, "monthlyHistory": monthlyHistory};
  }

  StatsDetailsEntity toEntity() {
    return StatsDetailsEntity(total: total, monthlyHistory: monthlyHistory);
  }
}
