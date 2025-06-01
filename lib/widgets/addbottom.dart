import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return SizedBox(
      width: 56.w,
      height: 56.h,
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor:
            backgroundColor ?? Theme.of(context).primaryColor,
        elevation: elevation ?? 0,
        tooltip: tooltip ?? 'Add new item',
        child: Icon(
          Icons.add,
          color: iconColor ?? Colors.white,
          size: 24.sp, 
        ),
      ),
    );
  }
}
