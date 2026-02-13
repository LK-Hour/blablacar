import 'package:blabla/data/dummy_data.dart';

import '../model/ride/locations.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  static const List<Location> availableLocations =
      fakeLocations; // TODO for now fake data

  ///
  /// Filter locations by search text (case-insensitive)
  ///
  static List<Location> filterLocations(String searchText) {
    if (searchText.isEmpty) {
      return [];
    }

    return availableLocations
        .where(
          (location) =>
              location.name.toUpperCase().contains(searchText.toUpperCase()),
        )
        .toList();
  }
}
