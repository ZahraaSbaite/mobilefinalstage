import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const CustomSearchBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF202D5A),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: TextField(
        style: TextStyle(
          color: const Color.fromARGB(255, 203, 199, 193),
          fontSize: 16.sp,
        ),
        decoration: InputDecoration(
          hintText: 'Search Courses...',
          hintStyle: TextStyle(
            color: const Color.fromARGB(255, 203, 199, 193),
            fontSize: 14.sp,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
            size: 20.w,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.h,
            horizontal: 16.w,
          ),
          isDense: true,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
