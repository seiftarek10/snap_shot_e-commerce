class StatsEntity {
  final StatsDetailsEntity totalUsers;
  final StatsDetailsEntity totalOrders;
  final int totalProducts;
  final num revenue;

  const StatsEntity({
    required this.totalUsers,
    required this.totalOrders,
    required this.totalProducts,
    required this.revenue
  });
}

class StatsDetailsEntity {
  final int total;
  final Map<String, int> monthlyHistory;

  const StatsDetailsEntity({required this.total, required this.monthlyHistory});
}
