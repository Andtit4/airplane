class Flight {
  final String from;
  final String to;
  final DateTime date;
  final int passengers;
  final bool isRoundTrip;

  Flight({
    required this.from,
    required this.to,
    required this.date,
    required this.passengers,
    required this.isRoundTrip,
  });
}