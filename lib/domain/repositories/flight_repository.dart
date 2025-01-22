import 'package:airplane/domain/entities/flight.dart';

abstract class FlightRepository {
  Future<List<Flight>> getFlashDeals();
  Future<List<Flight>> searchFlights(Flight searchCriteria);
}