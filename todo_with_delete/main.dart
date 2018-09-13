import "dart:html";

InputElement toDoInput;
UListElement toDoList;
ButtonElement deleteAll;

void change(Event e) {
  var newToDo = new LIElement();
  newToDo.text = toDoInput.value;
  newToDo.onClick.listen((e) => newToDo.remove());
  toDoInput.value = '';
  toDoList.children.add(newToDo);
}
void main() {
  toDoInput = querySelector('#input');
  toDoList = querySelector('#listUl');
  deleteAll = querySelector('#deleteAll');
  // 监听输入框的事件
  toDoInput.onChange.listen(change);
  deleteAll.onClick.listen((e) => toDoList.children.clear());
}
