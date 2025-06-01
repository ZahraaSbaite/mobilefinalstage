import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailScreen extends StatelessWidget {
  final String title;

  const DetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(fontSize: 20.sp)),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title Details',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'This screen shows more information about the selected section. '
              'Here, you could list services, show charts, display messages, or anything relevant to the section.',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 30.h),
            Placeholder(
              fallbackHeight: 200.h,
              color: Colors.green,
              strokeWidth: 2.w,
            ),
          ],
        ),
      ),
    );
  }
}
