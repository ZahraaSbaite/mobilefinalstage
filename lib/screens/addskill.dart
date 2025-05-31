import 'package:final_project/models/skill.dart';
import 'package:flutter/material.dart';


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
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 199, 193),
      appBar: AppBar(
        title: const Text("Add New Skill"),
        titleTextStyle: const TextStyle(
          color: Color(0xFF202D5A),
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        backgroundColor: const Color.fromARGB(255, 203, 199, 193),
        iconTheme: const IconThemeData(color: Color(0xFF202D5A)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Skill Name",
                labelStyle: TextStyle(color: Color(0xFF202D5A)),
              ),
              autofocus: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: "Description",
                labelStyle: TextStyle(color: Color(0xFF202D5A)),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => _pickDate(context, true),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: Color(0xFF202D5A),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _startDate == null
                              ? "Pick Start Date"
                              : "Start date: ${_formatDate(_startDate)}",
                          style: const TextStyle(
                            color: Color(0xFF202D5A),
                          ),
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
                        const Icon(
                          Icons.date_range,
                          color: Color(0xFF202D5A),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _endDate == null
                              ? "Pick End Date"
                              : " ${_formatDate(_endDate)}",
                          style: const TextStyle(
                            color: Color(0xFF202D5A),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitSkill,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF202D5A),
              ),
              child: const Text(
                "Save",
                style: TextStyle(
                  color: Color.fromARGB(255, 203, 199, 193),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
