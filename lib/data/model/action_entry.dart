class ActionEntry {
  final String type;
  final String description;
  final DateTime date;
  ActionEntry({
    required this.type,
    required this.description,

    required this.date,
  });
  Map<String,dynamic>toJson()=>{
    'type': type,
    'description': description,
    'date': date.toIso8601String(),
  };

  factory ActionEntry.fromJson(Map<String, dynamic> json) => ActionEntry(
    type: json['type'],
    description: json['description'],
    date: DateTime.parse(json['date']),
  );
}
