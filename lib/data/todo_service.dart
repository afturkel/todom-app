import '../models/todo.dart';

class TodoService {
  static List<Todo> todos = [];

  static List<Todo> getTodos() {
    if (todos.isEmpty) {
      todos.add(
        Todo(
          id: 1, 
          title: "Read Book", 
          description: "Read 15 pages from the Math Book", 
          isDone: true
          ));
      todos.add(
          Todo(
            id: 2, 
            title: "Dentist", 
            description: "Go to dentist", 
            isDone: false
            ));
      todos.add(
        Todo(
          id: 3,
          title: "Homework",
          description: "Finish your homeworks (Math and Physics)",
          isDone: false));
      todos.add(
        Todo(
          id: 4, 
          title: "Visit my Grandma", 
          description: "Visit grandma after school",
          isDone: false
          ));
    }
    return todos.where((element) => !element.isDone).toList();
  }

  static List<Todo> getDoneTodos(){
    return todos.where((element) => element.isDone).toList();
  }

}
