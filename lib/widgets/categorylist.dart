import 'package:final_project/models/category.dart';
import 'package:final_project/widgets/categoryitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: CategoryItem(
              categoryName: category.name,
              filteredCourses: category.courses,
            ),
          );
        },
      ),
    );
  }
}
