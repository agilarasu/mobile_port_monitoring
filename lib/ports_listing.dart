import 'dart:async';
import 'dart:io';

class PortsListing extends StatefulWidget {
  @override
  _PortsListingState createState() => _PortsListingState();
}

class _PortsListingState extends State<PortsListing> {
  Future<List<int>> getPorts() async {
    return await Platform.availablePorts();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getPorts().map((port) => Text(port.toString())).toList(),
    );
  }
}