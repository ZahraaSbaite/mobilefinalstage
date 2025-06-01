import 'package:final_project/models/course.dart';
import 'package:final_project/screens/skilldetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final String categoryName;
  final List<Course> filteredCourses;

  const CategoryItem({
    super.key,
    required this.categoryName,
    required this.filteredCourses,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        categoryName,
        style: TextStyle(
          color: const Color(0xFF202D5A),
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      children:
          filteredCourses.map((course) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: ListTile(
                leading: Icon(
                  Icons.book,
                  color: const Color(0xFF202D5A),
                  size: 24.sp,
                ),
                title: Text(
                  course.title,
                  style: TextStyle(fontSize: 16.sp),
                ),
                subtitle: Text(
                  'Code: ${course.code}',
                  style: TextStyle(fontSize: 14.sp),
                ),
                textColor: const Color(0xFF202D5A),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: const Color(0xFF202D5A),
                  size: 16.sp,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) =>
                              SkillDetailsScreen(course: course),
                    ),
                  );
                },
              ),
            );
          }).toList(),
    );
  }
}
