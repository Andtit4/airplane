import 'package:airplane/presentation/controllers/flight_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<FlightSearchController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Find the best deals for your\nnext journey.',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    // Search Type Toggle
                    Row(
                      children: [
                        Obx(() => _buildToggleButton('One-way')),
                        Obx(() => _buildToggleButton('Round-trip')),
                        Obx(() => _buildToggleButton('Multi-city')),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // City Selection Fields
                    _buildCityField(
                      'BKK',
                      'Bangkok, Thailand',
                      Icons.flight_takeoff,
                    ),
                    const SizedBox(height: 8),
                    _buildCityField(
                      'LED',
                      'St. Petersburg, Russia',
                      Icons.flight_land,
                    ),
                    const SizedBox(height: 16),
                    // Date and Passengers
                    Row(
                      children: [
                        Expanded(
                          child: _buildDateField(),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildPassengersField(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Search Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.searchFlights(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('Get Started'),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Flash Sale Section
              _buildFlashSaleSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text) {
    final isSelected = controller.searchType.value == text.toLowerCase();
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.setSearchType(text.toLowerCase()),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCityField(String code, String city, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                code,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                city,
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateField() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Date',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Obx(() => Text(
                controller.selectedDate.value.toString().split(' ')[0],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildPassengersField() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Passengers',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          Obx(() => Text(
                '${controller.passengers} Adult',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildFlashSaleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Flash Sale',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              '02h 14m',
              style: TextStyle(
                color: Colors.blue.shade400,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Flash Sale Items would be implemented here
      ],
    );
  }
}