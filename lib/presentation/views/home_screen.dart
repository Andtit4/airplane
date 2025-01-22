import 'package:airplane/presentation/controllers/flight_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

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
          icon: const Icon(Icons.menu)
            .animate()
            .fade(duration: 300.ms)
            .scale(delay: 200.ms),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined)
              .animate()
              .fade(duration: 300.ms)
              .scale(delay: 200.ms),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find the best deals for your\nnext journey.',
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                  color: Colors.white,
                ),
              ).animate()
                .fadeIn(duration: 600.ms)
                .slideX(begin: -0.2, end: 0),
              const SizedBox(height: 24),
              _buildSearchCard(),
              const SizedBox(height: 24),
              _buildFlashSaleSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
    ).animate()
      .fadeIn(duration: 800.ms, delay: 300.ms)
      .slideY(begin: 0.2, end: 0);
  }

  Widget _buildToggleButton(String text) {
    return Expanded(
      child: Obx(() {
        final isSelected = controller.searchType.value == text.toLowerCase();
        return GestureDetector(
          onTap: () => controller.setSearchType(text.toLowerCase()),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.grey.shade300,
              ),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ).animate(target: isSelected ? 1 : 0)
            .scale(begin: Offset(0, 1), end: Offset(0.95, 0))
            .fadeIn(),
        );
      }),
    );
  }

  Widget _buildCityField(String code, String city, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 24)
            .animate(onPlay: (controller) => controller.repeat())
            .shimmer(duration: 2000.ms, delay: 1000.ms),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                code,
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                city,
                style: GoogleFonts.inter(
                  color: Colors.grey.shade600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate()
      .fadeIn(duration: 600.ms)
      .slideX(begin: -0.2, end: 0);
  }

  Widget _buildDateField() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date',
            style: GoogleFonts.inter(
              color: Colors.grey.shade600,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Obx(() => Text(
            controller.selectedDate.value.toString().split(' ')[0],
            style: GoogleFonts.inter(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          )),
        ],
      ),
    ).animate()
      .fadeIn(duration: 600.ms)
      .slideY(begin: 0.2, end: 0);
  }

  Widget _buildFlashSaleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Flash Sale',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Icon(Icons.flash_on, color: Colors.blue.shade400, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    '02h 14m',
                    style: GoogleFonts.inter(
                      color: Colors.blue.shade400,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ).animate(onPlay: (controller) => controller.repeat())
              .shimmer(duration: 2000.ms),
          ],
        ),
        const SizedBox(height: 16),
        _buildFlashSaleCard(),
      ],
    ).animate()
      .fadeIn(duration: 800.ms, delay: 600.ms)
      .slideY(begin: 0.2, end: 0);
  }

  Widget _buildFlashSaleCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade900, Colors.blue.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/pegasus_logo.png',
                height: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Pegasus Airlines',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DXB',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Dubai, UAE',
                    style: GoogleFonts.inter(
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.flight,
                color: Colors.white.withOpacity(0.7),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'LED',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'St. Petersburg',
                    style: GoogleFonts.inter(
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ).animate()
      .fadeIn(duration: 800.ms)
      .slideX(begin: 0.2, end: 0);
  }
}