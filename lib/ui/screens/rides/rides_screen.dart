import 'package:flutter/material.dart';
import '../../../model/ride_pref/ride_pref.dart';
import '../../../utils/date_time_utils.dart';
import '../../theme/theme.dart';

///
/// The Ride Selection screen allow user to select a ride
///
class RidesScreen extends StatelessWidget {
  final RidePref initialRidePref;

  const RidesScreen({super.key, required this.initialRidePref});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(BlaSpacings.m),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: BlaSpacings.s),
              Container(
                decoration: BoxDecoration(
                  color: BlaColors.backgroundAccent,
                  borderRadius: BorderRadius.circular(BlaSpacings.radius),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: BlaSpacings.xl,
                      ),
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: BlaColors.iconLight,
                          size: BlaSpacings.m,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: BlaSpacings.m),
              Container(
                padding: const EdgeInsets.all(BlaSpacings.m),
                decoration: BoxDecoration(
                  color: BlaColors.backgroundAccent,
                  borderRadius: BorderRadius.circular(BlaSpacings.radius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Departure: ${initialRidePref.departure.name}',
                      style: BlaTextStyles.body.copyWith(
                        color: BlaColors.textNormal,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Arrival: ${initialRidePref.arrival.name}',
                      style: BlaTextStyles.body.copyWith(
                        color: BlaColors.textNormal,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Time: ${DateTimeUtils.formatTime(initialRidePref.departureDate)}',
                      style: BlaTextStyles.body.copyWith(
                        color: BlaColors.textNormal,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Seats: ${initialRidePref.requestedSeats}',
                      style: BlaTextStyles.body.copyWith(
                        color: BlaColors.textNormal,
                      ),
                    ),
                    const SizedBox(height: BlaSpacings.xl),

                    Center(
                      child: Text(
                        'Not the fianl look, but just to test the preferences!',
                        style: BlaTextStyles.body.copyWith(
                          color: BlaColors.textLight,
                          fontStyle: FontStyle.italic,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
