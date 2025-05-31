class Skill {
  final int? id; // Optional ID (autoincrement)
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;

  Skill({
    this.id,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
  });

  // Convert to map for database storage
  Map<String, Object?> get skillMap {
    return {
      'id': id,
      'name': name,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }

  // Create a Skill from map (from database)
  factory Skill.fromMap(Map<String, dynamic> map) {
    return Skill(
      id: map['id'] as int?,
      name: map['name'] as String,
      description: map['description'] as String,
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
    );
  }

  @override
  String toString() {
    return '$name ($startDate - $endDate): $description';
  }
}
