import 'package:flutter/material.dart';
import 'dart:math';

class AppBehaviourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Behaviour'),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20), // Add top gap
              const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Apps',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: _buildAppList(),
              ),
              const SizedBox(height: 20), // Add bottom gap
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppList() {
    List<Map<String, dynamic>> apps = List.generate(20, (index) {
      final bool isCameraInUse = Random().nextBool();
      final bool isMicInUse = Random().nextBool();
      final String appStatus = _getAppStatus(isCameraInUse, isMicInUse);

      return {
        'name': 'App $index',
        'status': appStatus,
      };
    });

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Scrollbar(
        child: ListView.builder(
          itemCount: apps.length,
          itemBuilder: (context, index) {
            final app = apps[index];
            return ListTile(
              title: Text(
                app['name'],
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              trailing: Text(
                app['status'],
                style: const TextStyle(fontSize: 12, color: Colors.red),
              ),
            );
          },
        ),
      ),
    );
  }

  String _getAppStatus(bool isCameraInUse, bool isMicInUse) {
    if (isCameraInUse && isMicInUse) {
      return 'Camera and Mic in Use';
    } else if (isCameraInUse) {
      return 'Camera in Use';
    } else if (isMicInUse) {
      return 'Mic in Use';
    } else {
      return 'Not in Use';
    }
  }
}
