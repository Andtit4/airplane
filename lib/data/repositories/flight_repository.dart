import 'package:airplane/domain/entities/flight.dart';
import 'package:airplane/domain/repositories/flight_repository.dart';

class FlightRepositoryImpl implements FlightRepository {
  @override
  Future<List<Flight>> getFlashDeals() async {
    // Implement API call here
    return [];
  }

  @override
  Future<List<Flight>> searchFlights(Flight searchCriteria) async {
    // Implement API call here
    return [];
  }
}