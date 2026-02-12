import 'package:flutter/material.dart';
import '../../../model/ride/locations.dart';

///
/// This full-screen modal is in charge of providing (if confirmed) a selected location.
/// TODO: Implement BLA-004 - LocationPicker with search functionality
///
class BlaLocationPicker extends StatelessWidget {
  final Location? initLocation;

  const BlaLocationPicker({super.key, this.initLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Location')),
      body: const Center(
        child: Text('Location picker - Coming soon (BLA-004)'),
      ),
    );
  }
}
