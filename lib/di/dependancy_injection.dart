import 'package:airplane/data/repositories/flight_repository.dart';
import 'package:airplane/domain/repositories/flight_repository.dart';
import 'package:airplane/presentation/controllers/flight_search_controller.dart';
import 'package:get/get.dart';

void setupDependencies() {
  // Repositories
  Get.lazyPut<FlightRepository>(
    () => FlightRepositoryImpl(),
  );

  // Controllers
  Get.lazyPut(
    () => FlightSearchController(
      repository: Get.find<FlightRepository>(),
    ),
  );
}