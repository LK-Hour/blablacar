import 'package:flutter/material.dart';
import '../widgets/actions/bla_button.dart';

/// Simple test screen to validate BlaButton variations
class TestBlaButtonScreen extends StatelessWidget {
  const TestBlaButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BlaButton Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Primary button
            BlaButton(
              text: 'Primary Button',
              onPressed: () => print('Primary pressed'),
              type: ButtonType.primary,
            ),
            SizedBox(height: 16),

            // Secondary button
            BlaButton(
              text: 'Secondary Button',
              onPressed: () => print('Secondary pressed'),
              type: ButtonType.secondary,
            ),
            SizedBox(height: 16),

            // Primary with icon
            BlaButton(
              text: 'Primary with Icon',
              icon: Icons.search,
              onPressed: () => print('Primary with icon pressed'),
              type: ButtonType.primary,
            ),
            SizedBox(height: 16),

            // Secondary with icon
            BlaButton(
              text: 'Secondary with Icon',
              icon: Icons.filter_list,
              onPressed: () => print('Secondary with icon pressed'),
              type: ButtonType.secondary,
            ),
            SizedBox(height: 16),

            // Disabled primary
            BlaButton(
              text: 'Disabled Primary',
              onPressed: null,
              type: ButtonType.primary,
            ),
            SizedBox(height: 16),

            // Disabled secondary
            BlaButton(
              text: 'Disabled Secondary',
              onPressed: null,
              type: ButtonType.secondary,
            ),
          ],
        ),
      ),
    );
  }
}
