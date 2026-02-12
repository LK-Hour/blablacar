import 'package:flutter/material.dart';
import '../../../model/ride_pref/ride_pref.dart';

///
/// The Ride Selection screen allow user to select a ride, once ride preferences have been defined.
/// TODO: Implement BLA-006 - Draft Rides screen
///
class RidesScreen extends StatelessWidget {
  final RidePref initialRidePref;

  const RidesScreen({super.key, required this.initialRidePref});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Available Rides')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Searching rides from ${initialRidePref.departure.name}'),
            Text('to ${initialRidePref.arrival.name}'),
            const SizedBox(height: 20),
            const Text('Rides list - Coming soon (BLA-006)'),
          ],
        ),
      ),
    );
  }
}
