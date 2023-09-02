import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PortOverviewPage extends StatelessWidget {
  final Widget homePage;

  PortOverviewPage({required this.homePage});

  @override
  Widget build(BuildContext context) {
    // Check if the screen is in portrait mode
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Port Overview'),
      ),
      body: isPortrait
          ? _buildPortraitContent()
          : _buildLandscapeContent(), // Choose content based on orientation
    );
  }

  Widget _buildPortraitContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Port Security Status',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 5),
          _buildProgressBarChart(),
          _buildNumberInfoContainer(),
        ],
      ),
    );
  }

  Widget _buildLandscapeContent() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            const Text(
              'Port Security Status',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 5),
            _buildProgressBarChart(),
            _buildNumberInfoContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBarChart() {
    double percentage = 75; // Replace with your desired percentage value

    return Column(
      children: [
        Text(
          '${percentage.toInt()}%',
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 150,
          width: 150,
          child: PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  value: percentage,
                  color: Colors.green[600]!,
                  title: '',
                ),
                PieChartSectionData(
                  value: 100 - percentage,
                  color: Colors.red[600]!,
                  title: '',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNumberInfoContainer() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                '2358',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Add text color
                ),
              ),
              Text(
                'Closed Ports',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.green, // Add text color
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '1857',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Add text color
                ),
              ),
              Text(
                'Open Ports',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.red, // Add text color
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
