
List<Map<String, dynamic>> toDo = [];

void addTodo({required String title, required String detail}) {
  Map<String, dynamic> todoMap = {
    'title': title,
    'detail': detail,

  };
  toDo.add(todoMap);
print(toDo);

}

void editedTodo({required String title,required String detail,required int index}){
  Map<String,dynamic> editMap={
    'title' :title,
    'detail' : detail,

  };
  toDo[index] = editMap;



}

void deleteTodo({required int index }){
  toDo.removeAt(index);
}

List<Map<String, dynamic>> completedToDo = [];
void completeTodo({
  required int index,
}) {
  completedToDo.add(toDo[index]);
  toDo.removeAt(index);
}
