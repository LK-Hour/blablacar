import '../data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static List<Ride> availableRides = fakeRides; // TODO for now fake data

  static List<Ride> filterByDeparture(Location departure, List<Ride> rides) {
    return rides.where((ride) => ride.departureLocation == departure).toList();
  }

  static List<Ride> filterBySeatRequested(int seatRequested, List<Ride> rides) {
    return rides.where((ride) => ride.availableSeats == seatRequested).toList();
  }

  static List<Ride> filterBy({Location? departure, int? seatRequested}) {
    List<Ride> results = availableRides;

    if (departure != null) {
      results = filterByDeparture(departure, results);
    }

    if (seatRequested != null) {
      results = filterBySeatRequested(seatRequested, results);
    }

    return results;
  }
}
