import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonWithIcon extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  final String label;

  ButtonWithIcon({this.iconData, this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
      onPressed: onPressed, icon: FaIcon(iconData),
      label: Text(label),);
  }
}
