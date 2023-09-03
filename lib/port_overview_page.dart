import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PortOverviewPage extends StatefulWidget {
  final Widget homePage;

  PortOverviewPage({required this.homePage});

  @override
  Widget build(BuildContext context) {
    // Get the list of available ports
    List<int> ports = await Platform.availablePorts();

    // Get the percentage of open ports
    int openPorts = ports.where((port) => port >= 1024).length;
    int closedPorts = ports.length - openPorts;
    double percentage = (openPorts / ports.length) * 100;

    // Create the pie chart data
    List<PieChartSectionData> pieChartData = [
      PieChartSectionData(
        value: percentage,
        color: Colors.green[600]!,
        title: 'Open Ports (${openPorts})',
      ),
      PieChartSectionData(
        value: 100 - percentage,
        color: Colors.red[600]!,
        title: 'Closed Ports (${closedPorts})',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Port Overview'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Port Security Status',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 5),
            _buildProgressBarChart(pieChartData),
            _buildNumberInfoContainer(openPorts, closedPorts),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBarChart(List<PieChartSectionData> pieChartData) {
    return Column(
      children: [
        Text(
          '${pieChartData[0].value.toInt()}%',
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 150,
          width: 150,
          child: PieChart(
            PieChartData(
              sections: pieChartData,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNumberInfoContainer(int openPorts, int closedPorts) {
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
                  color: Colors.black,
                ),
              ),
              Text(
                'Closed Ports',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.green,
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
                  color: Colors.black,
                ),
              ),
              Text(
                'Open Ports',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}