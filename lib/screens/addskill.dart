import 'package:final_project/models/skill.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddSkillScreen extends StatefulWidget {
  const AddSkillScreen({super.key});

  @override
  State<AddSkillScreen> createState() => _AddSkillScreenState();
}

class _AddSkillScreenState extends State<AddSkillScreen> {
  final TextEditingController _nameController =
      TextEditingController();
  final TextEditingController _descriptionController =
      TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickDate(
    BuildContext context,
    bool isStartDate,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          _startDate = picked;
          if (_endDate != null && _endDate!.isBefore(picked)) {
            _endDate = null;
          }
        } else {
          if (_startDate != null && picked.isBefore(_startDate!)) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("End date cannot be before start date"),
              ),
            );
            return;
          }
          _endDate = picked;
        }
      });
    }
  }

  void _submitSkill() {
    String name = _nameController.text.trim();
    String description = _descriptionController.text.trim();

    if (name.isEmpty || _startDate == null || _endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all required fields"),
        ),
      );
      return;
    }

    final skill = Skill(
      name: name,
      description: description,
      startDate: _startDate!,
      endDate: _endDate!,
    );

    Navigator.pop(context, {'success': true, 'skill': skill});
  }

  String _formatDate(DateTime? date) {
    if (date == null) return "";
    return DateFormat('MMM dd, yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 199, 193),
      appBar: AppBar(
        title: Text(
          "Add New Skill",
          style: TextStyle(
            color: const Color(0xFF202D5A),
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 203, 199, 193),
        iconTheme: const IconThemeData(color: Color(0xFF202D5A)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 8.h),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Skill Name",
                labelStyle: TextStyle(
                  color: const Color(0xFF202D5A),
                  fontSize: 16.sp,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFF202D5A),
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFF202D5A),
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              style: TextStyle(
                color: const Color(0xFF202D5A),
                fontSize: 16.sp,
              ),
              autofocus: true,
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: "Description",
                labelStyle: TextStyle(
                  color: const Color(0xFF202D5A),
                  fontSize: 16.sp,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFF202D5A),
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xFF202D5A),
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              maxLines: 1,
              style: TextStyle(
                color: const Color(0xFF202D5A),
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => _pickDate(context, true),
                    child: Column(
                      children: [
                        Icon(
                          Icons.date_range,
                          color: const Color(0xFF202D5A),
                          size: 24.sp,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          _startDate == null
                              ? "Pick Start Date"
                              : "Start: ${_formatDate(_startDate)}",
                          style: TextStyle(
                            color: const Color(0xFF202D5A),
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () => _pickDate(context, false),
                    child: Column(
                      children: [
                        Icon(
                          Icons.date_range,
                          color: const Color(0xFF202D5A),
                          size: 24.sp,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          _endDate == null
                              ? "Pick End Date"
                              : "End: ${_formatDate(_endDate)}",
                          style: TextStyle(
                            color: const Color(0xFF202D5A),
                            fontSize: 14.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: _submitSkill,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF202D5A),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: const Color.fromARGB(255, 203, 199, 193),
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
