import 'package:final_project/data/courses.dart';
import 'package:final_project/models/category.dart';
import 'package:final_project/models/course.dart';
import 'package:final_project/models/sort.dart';
import 'package:final_project/widgets/categorylist.dart';
import 'package:final_project/widgets/searchbar.dart';
import 'package:final_project/widgets/searchresult.dart';
import 'package:final_project/widgets/sortorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String _searchQuery = '';
  Map<Course, Category> _courseToCategoryMap = {};
  SortOrder _sortOrder = SortOrder.ascending;

  List<Course> _getSearchedCourses() {
    if (_searchQuery.isEmpty) {
      _courseToCategoryMap.clear();
      return [];
    }

    final lowerQuery = _searchQuery.toLowerCase();
    final Map<Course, Category> result = {};

    for (var category in dummyCategories) {
      for (var course in category.courses) {
        if (course.title.toLowerCase().contains(lowerQuery) ||
            course.code.toLowerCase().contains(lowerQuery)) {
          result[course] = category;
        }
      }
    }

    _courseToCategoryMap = result;

    final sortedCourses =
        result.keys.toList()..sort(
          (a, b) =>
              _sortOrder == SortOrder.ascending
                  ? a.title.compareTo(b.title)
                  : b.title.compareTo(a.title),
        );

    return sortedCourses;
  }

  void _openFilterSortModal() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.r),
        ),
      ),
      builder: (_) {
        return FilterSortModal(
          currentSortOrder: _sortOrder,
          onApply: (SortOrder selectedOrder) {
            setState(() {
              _sortOrder = selectedOrder;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final searchedCourses = _getSearchedCourses();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 199, 193),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Explore',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF202D5A),
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: CustomSearchBar(
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 10.w),
                FilterButton(onPressed: _openFilterSortModal),
              ],
            ),
            SizedBox(height: 20.h),
            Expanded(
              child:
                  _searchQuery.isNotEmpty
                      ? SearchResult(
                        courses: searchedCourses,
                        courseToCategoryMap: _courseToCategoryMap,
                        hasSearched: true,
                      )
                      : CategoryList(categories: dummyCategories),
            ),
          ],
        ),
      ),
    );
  }
}
