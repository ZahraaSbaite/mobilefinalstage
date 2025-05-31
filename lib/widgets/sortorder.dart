import 'package:final_project/models/sort.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const FilterButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 203, 199, 193),
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        icon: const Icon(Icons.filter_list, color: Color(0xFF202D5A)),
        onPressed: onPressed,
        iconSize: 35,
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
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 203, 199, 193),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Filter & Sort',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF202D5A), 
            ),
          ),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Sort by Title',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF202D5A), 
              ),
            ),
          ),
          RadioListTile<SortOrder>(
            title: const Text(
              'Ascending',
              style: TextStyle(color: Color(0xFF202D5A)),
            ),
            value: SortOrder.ascending,
            groupValue: _selectedSortOrder,
            activeColor: Color(0xFF202D5A),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedSortOrder = value;
                });
              }
            },
          ),
          RadioListTile<SortOrder>(
            title: const Text(
              'Descending',
              style: TextStyle(color: Color(0xFF202D5A)),
            ),
            value: SortOrder.descending,
            groupValue: _selectedSortOrder,
            activeColor: Color(0xFF202D5A),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedSortOrder = value;
                });
              }
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(
                0xFF202D5A,
              ), // Button color
              foregroundColor: Color.fromARGB(255, 203, 199, 193), 
            ),
            onPressed: () {
              Navigator.pop(context);
              widget.onApply(_selectedSortOrder);
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }
}
