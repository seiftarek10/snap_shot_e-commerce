class MonthlyRate {
  final String month; // This will hold the short name (e.g., "Jan", "Feb")
  final double value; // This holds the numeric value

  MonthlyRate({required this.month, required this.value});

  // Factory constructor handles parsing and automatic conversion
  factory MonthlyRate.fromMapEntry(String key, dynamic value) {
    return MonthlyRate(
      month: _convertToShortMonth(key),
      value: (value as num).toDouble(),
    );
  }

  // Helper method to turn "2026-01" into "Jan"
  static String _convertToShortMonth(String key) {
    final parts = key.split('-');
    if (parts.length < 2) return key; // Safety fallback

    switch (parts[1]) {
      case '01': return 'Jan';
      case '02': return 'Feb';
      case '03': return 'Mar';
      case '04': return 'Apr';
      case '05': return 'May';
      case '06': return 'Jun';
      case '07': return 'Jul';
      case '08': return 'Aug';
      case '09': return 'Sep';
      case '10': return 'Oct';
      case '11': return 'Nov';
      case '12': return 'Dec';
      default: return key;
    }
  }
}

// Function to convert your Firebase map into a sorted List<MonthlyRate>
List<MonthlyRate> generateMonthlyRates(Map<String, dynamic> monthlyHistory) {
  // 1. Sort the raw map keys first so the list stays in correct calendar order (Jan -> Dec)
  final sortedEntries = monthlyHistory.entries.toList()
    ..sort((a, b) => a.key.compareTo(b.key));

  // 2. Map the sorted data into your MonthlyRate list
  return sortedEntries.map((entry) {
    return MonthlyRate.fromMapEntry(entry.key, entry.value);
  }).toList();
}