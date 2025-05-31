import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? elevation;
  final String? tooltip;

  const AddButton({
    super.key,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.elevation,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor:
          backgroundColor ?? Theme.of(context).primaryColor,
      elevation: 0,
      tooltip: tooltip ?? 'Add new item',
      child: Icon(Icons.add, color: iconColor ?? Colors.white),
    );
  }
}
