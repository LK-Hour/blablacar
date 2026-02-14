import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class BlaSeatSpinner extends StatefulWidget {
  final int initialSeats;

  const BlaSeatSpinner({super.key, this.initialSeats = 1});

  @override
  State<BlaSeatSpinner> createState() => _BlaSeatSpinnerState();
}

class _BlaSeatSpinnerState extends State<BlaSeatSpinner> {
  late int currentSeats;

  @override
  void initState() {
    super.initState();
    currentSeats = widget.initialSeats;
  }

  void onIncrementPressed() {
    setState(() {
      if (currentSeats < 8) {
        currentSeats++;
      }
    });
  }

  void onDecrementPressed() {
    setState(() {
      if (currentSeats > 1) {
        currentSeats--;
      }
    });
  }

  void onConfirmPressed() {
    Navigator.of(context).pop(currentSeats);
  }

  void onClosePressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(BlaSpacings.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Close button
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: onClosePressed,
                    icon: Icon(Icons.close, color: BlaColors.primary),
                  ),
                ],
              ),

              const SizedBox(height: BlaSpacings.m),

              // Title
              Text('Number of seats to book', style: BlaTextStyles.heading),

              const SizedBox(height: BlaSpacings.xl),

              // Spinner controls: minus, number, plus
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Minus button (aligned to left edge)
                  IconButton(
                    onPressed: currentSeats > 1 ? onDecrementPressed : null,
                    icon: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: currentSeats > 1
                              ? BlaColors.iconLight
                              : BlaColors.disabled,
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        Icons.remove,
                        color: currentSeats > 1
                            ? BlaColors.iconLight
                            : BlaColors.disabled,
                        size: 24,
                      ),
                    ),
                  ),

                  // Current number display
                  Text(
                    currentSeats.toString(),
                    style: TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),

                  // Plus button
                  IconButton(
                    onPressed: currentSeats < 8 ? onIncrementPressed : null,
                    icon: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentSeats < 8
                            ? BlaColors.primary
                            : BlaColors.disabled,
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 24),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  onPressed: onConfirmPressed,
                  backgroundColor: BlaColors.primary,
                  shape: CircleBorder(),
                  child: Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
