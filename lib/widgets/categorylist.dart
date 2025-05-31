import 'package:final_project/models/category.dart';
import 'package:final_project/widgets/categoryitem.dart';
import 'package:flutter/material.dart';


class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryItem(
          categoryName: category.name,
          filteredCourses: category.courses,
        );
      },
    );
  }
}
