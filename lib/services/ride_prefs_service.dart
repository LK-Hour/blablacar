import '../data/dummy_data.dart';
import '../model/ride_pref/ride_pref.dart';

////
///   This service handles:
///   - History of the last ride preferences        (to allow users to re-use their last preferences)
///   - Curent selected ride preferences.
///

abstract class RidePreferencesListener {
  void onPreferenceSelected(RidePref selectedPreference);
}

class RidePrefsService {
  static RidePref? selectedRidePref; // The current selected ride preference

  static List<RidePref> ridePrefsHistory = fakeRidePrefs;
  final List<RidePref> _listener = [];

  void addListener(RidePreferencesListener listener) {
    _listener.add(listener as RidePref);
  }

  // void _notifyListener() {
  //   RidePreferencesListener.forEach((pref) => pref.onPreferenceSelected());
  // }
}
