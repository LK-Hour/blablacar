import 'package:flutter/material.dart';
import '../../../theme/theme.dart';

///
/// This tile represents a selectable tile on the Ride Preference screen
///
class RidePrefInputTile extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData leftIcon;

  // If true the text is displayed lighter
  final bool isPlaceHolder;

  final IconData? rightIcon;
  final VoidCallback? onRightIconPressed;

  const RidePrefInputTile({
    super.key,
    required this.title,
    required this.onPressed,
    required this.leftIcon,
    this.rightIcon,
    this.onRightIconPressed,
    this.isPlaceHolder = false,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = isPlaceHolder
        ? BlaColors.textLight
        : BlaColors.textNormal;

    return ListTile(
      onTap: onPressed,
      title: Text(
        title,
        style: BlaTextStyles.button.copyWith(fontSize: 14, color: textColor),
      ),
      leading: Icon(leftIcon, size: 24, color: BlaColors.iconLight),
      trailing: rightIcon != null
          ? IconButton(
              icon: Icon(rightIcon, color: BlaColors.primary),
              onPressed: onRightIconPressed,
            )
          : null,
    );
  }
}
