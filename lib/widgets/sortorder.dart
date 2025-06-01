import 'package:final_project/models/sort.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const FilterButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 203, 199, 193),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: IconButton(
        icon: Icon(Icons.filter_list, color: const Color(0xFF202D5A)),
        onPressed: onPressed,
        iconSize: 35.sp,
      ),
    );
  }
}

class FilterSortModal extends StatefulWidget {
  final SortOrder currentSortOrder;
  final Function(SortOrder) onApply;

  const FilterSortModal({
    super.key,
    required this.currentSortOrder,
    required this.onApply,
  });

  @override
  State<FilterSortModal> createState() => _FilterSortModalState();
}

class _FilterSortModalState extends State<FilterSortModal> {
  late SortOrder _selectedSortOrder;

  @override
  void initState() {
    super.initState();
    _selectedSortOrder = widget.currentSortOrder;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 203, 199, 193),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.r),
        ),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Filter & Sort',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF202D5A),
            ),
          ),
          SizedBox(height: 16.h),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Sort by Title',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF202D5A),
              ),
            ),
          ),
          RadioListTile<SortOrder>(
            title: Text(
              'Ascending',
              style: TextStyle(
                color: const Color(0xFF202D5A),
                fontSize: 14.sp,
              ),
            ),
            value: SortOrder.ascending,
            groupValue: _selectedSortOrder,
            activeColor: const Color(0xFF202D5A),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedSortOrder = value;
                });
              }
            },
          ),
          RadioListTile<SortOrder>(
            title: Text(
              'Descending',
              style: TextStyle(
                color: const Color(0xFF202D5A),
                fontSize: 14.sp,
              ),
            ),
            value: SortOrder.descending,
            groupValue: _selectedSortOrder,
            activeColor: const Color(0xFF202D5A),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedSortOrder = value;
                });
              }
            },
          ),
          SizedBox(height: 10.h),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF202D5A),
              foregroundColor: const Color.fromARGB(
                255,
                203,
                199,
                193,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 24.w,
                vertical: 12.h,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
              widget.onApply(_selectedSortOrder);
            },
            child: Text('Apply', style: TextStyle(fontSize: 16.sp)),
          ),
        ],
      ),
    );
  }
}
