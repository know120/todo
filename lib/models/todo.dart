class Todo {
  int id;
  String title;
  String details;
  int isDone;

  Todo(this.id, this.title, this.details, this.isDone);

  Todo.fromMap(Map<String, dynamic> result)
      : id = result['id'],
        title = result['title'],
        details = result['title'],
        isDone = result['isDone'];

  Map<String, Object> toMap() {
    return {'id': id, 'title': title, 'details': details, 'isDone': isDone};
  }
}
