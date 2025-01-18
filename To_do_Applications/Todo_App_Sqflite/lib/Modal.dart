class Todo {
  final String name;
  final String description;
  final String date;

  const Todo(
      {required this.name, required this.description, required this.date});

  @override
  String toString() {
    return 'Todo(name:$name , description: $description, date: $date)';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name ?? 'Name',
      'description': description ?? 'Description',
      'date': date ?? 'Date',
    };
  }

  static fromMap(Map<String, dynamic> map) {}
}
