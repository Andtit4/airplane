import 'package:airplane/domain/entities/flight.dart';
import 'package:airplane/domain/repositories/flight_repository.dart';
import 'package:get/get.dart';

class FlightSearchController extends GetxController {
  final FlightRepository repository;
  
  FlightSearchController({required this.repository});

  final searchType = 'one-way'.obs;
  final departureCity = ''.obs;
  final arrivalCity = ''.obs;
  final selectedDate = DateTime.now().obs;
  final passengers = 1.obs;
  final flashDeals = <Flight>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFlashDeals();
  }

  void setSearchType(String type) {
    searchType.value = type;
  }

  Future<void> loadFlashDeals() async {
    try {
      final deals = await repository.getFlashDeals();
      flashDeals.value = deals;
    } catch (e) {
      print('Error loading flash deals: $e');
    }
  }

  Future<void> searchFlights() async {
    try {
      final searchCriteria = Flight(
        from: departureCity.value,
        to: arrivalCity.value,
        date: selectedDate.value,
        passengers: passengers.value,
        isRoundTrip: searchType.value == 'round-trip',
      );
      await repository.searchFlights(searchCriteria);
    } catch (e) {
      print('Error searching flights: $e');
    }
  }
}