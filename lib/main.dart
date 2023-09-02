import 'package:flutter/material.dart';
import 'port_overview_page.dart';
import 'app_behaviour_page.dart';
import 'app_blocklist_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Port Monitoring App',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue[300],
        scaffoldBackgroundColor: Colors.blue[300],
      ),
      routes: {
        '/': (context) => const MyHomePage(),
        '/port_overview': (context) => PortOverviewPage(homePage: MyHomePage()),
        '/app_behaviour': (context) => AppBehaviourPage(),
        '/app_blocklist': (context) => AppBlocklistPage(homePage: MyHomePage()),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showPorts = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Port Monitoring', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue[50],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showPorts = !showPorts;
                        });
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue[700],
                        ),
                        child: Center(
                          child: showPorts
                              ? const Text(
                                  '57294', // Replace with your 5-digit number
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : const Text(
                                  'Scan for Ports',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (showPorts)
                      const Text(
                        'Number of Ports Available',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    _buildGridItem(context, 'Port Overview', 'assets/images/port_overview.png', '/port_overview'),
                    _buildGridItem(context, 'App Behaviour', 'assets/images/app_behaviour.png', '/app_behaviour'),
                    _buildGridItem(context, 'App Blocklist', 'assets/images/app_blocklist.png', '/app_blocklist'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String label, String imagePath, String route) {
    return Column(
      key: ValueKey(label),
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(imagePath, width: 150, height: 150),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(route);
          },
          child: Text(label),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
