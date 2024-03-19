class Todo {
  int id;
  String title;
  String details;
  int isDone;

  Todo(this.id, this.title, this.details, this.isDone);

  Todo.fromMap(Map<String, dynamic> result)
      : id = result['id'],
        title = result['title'],
        details = result['details'],
        isDone = result['isDone'];

  Map<String, Object> toMap() {
    return {'title': title, 'details': details, 'isDone': isDone};
  }

  Map<String, Object> toMapUpdate() {
    return {'id': id, 'title': title, 'details': details, 'isDone': isDone};
  }
}
