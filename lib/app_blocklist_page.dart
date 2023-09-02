import 'package:flutter/material.dart';

class AppBlocklistPage extends StatelessWidget {
  final Widget homePage; // Define the 'homePage' parameter

  AppBlocklistPage({required this.homePage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Blocklist', style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Blocked Apps',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildBlocklist(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBlocklist() {
    List<String> blockedApps = List.generate(8, (index) => 'Blocked App $index');

    return Column(
      children: blockedApps.map((app) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          height: 80.0, // Set the height to match the previous white boxes
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3), // Transparent tinted container
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            title: Center(
              child: Text(
                app,
                textAlign: TextAlign.center, // Align text to center along the y-axis
                style: const TextStyle(
                  fontSize: 20, // Increase the font size
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Text color set to white
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
