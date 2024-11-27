class TodoModel {
  static const  String collectionName = 'todo';
  String id;
  String title;
  String description;
  DateTime date;
  bool isDone;

  TodoModel(
      {required this.id, required this.title, required this.description, required this.date, required this.isDone});

  Map<String, dynamic> toFireStore() =>
      {
        'id': id,
        'title': title,
        'description': description,
        'date': date,
        'isDone': isDone,
      };

  TodoModel.fromFireStore(Map<String, dynamic> todo) : this(
      id: todo['id'],
      title: todo['title'],
      description: todo['description'],
      date: todo['date'].toDate(),
      isDone: todo['isDone']
  );
}