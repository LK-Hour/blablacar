import 'package:blabla/model/ride/ride.dart';
import 'package:blabla/model/ride/locations.dart';
import 'package:blabla/services/rides_service.dart';

void main() {
  print('=== Testing RidesService ===\n');
  print('Total available rides: ${RidesService.availableRides.length}\n');

  // --- Test 1: filterByDeparture ---
  Location dijon = Location(name: "Dijon", country: Country.france);
  List<Ride> ridesFromDijon = RidesService.filterByDeparture(
    dijon,
    RidesService.availableRides,
  );
  print('--- Test 1: filterByDeparture("Dijon") ---');
  print('Found ${ridesFromDijon.length} ride(s) departing from Dijon');
  for (Ride ride in ridesFromDijon) {
    print('  -> $ride');
  }

  // --- Test 2: filterBySeatRequested ---
  List<Ride> ridesWith2Seats = RidesService.filterBySeatRequested(
    2,
    RidesService.availableRides,
  );
  print('\n--- Test 2: filterBySeatRequested(2) ---');
  print('Found ${ridesWith2Seats.length} ride(s) with 2 seats available');
  for (Ride ride in ridesWith2Seats) {
    print('  -> $ride');
  }

  // --- Test 3: filterBy with both criteria (from the PDF example) ---
  List<Ride> filteredRides = RidesService.filterBy(
    departure: Location(name: "Dijon", country: Country.france),
    seatRequested: 2,
  );
  print('\n--- Test 3: filterBy(departure: Dijon, seatRequested: 2) ---');
  print('Found ${filteredRides.length} ride(s)');
  for (Ride ride in filteredRides) {
    print('  -> $ride');
  }

  // --- Test 4: filterBy with only departure ---
  List<Ride> onlyDeparture = RidesService.filterBy(departure: dijon);
  print('\n--- Test 4: filterBy(departure: Dijon) ---');
  print('Found ${onlyDeparture.length} ride(s)');

  // --- Test 5: filterBy with only seats ---
  List<Ride> onlySeats = RidesService.filterBy(seatRequested: 3);
  print('\n--- Test 5: filterBy(seatRequested: 3) ---');
  print('Found ${onlySeats.length} ride(s)');

  // --- Test 6: filterBy with no criteria (should return all rides) ---
  List<Ride> allRides = RidesService.filterBy();
  print('\n--- Test 6: filterBy() with no criteria ---');
  print(
    'Found ${allRides.length} ride(s) (should equal total: ${RidesService.availableRides.length})',
  );

  print('\n=== All tests completed ===');
}
