import "dart:html";

void main() {
  var text = querySelector("#textId");
  print(text);
  text
    ..text = "Welcome to Dart!"
    ..style.backgroundColor = '#f87c45'
    ..lang = 'EN'
    ..attributes.forEach((k, v) => print('$k: $v'));

  var div = new DivElement() // 实例化一个Element并设置数据
    ..id = 'div_id'
    ..text = 'Replacement element';
  text.replaceWith(div); // 替换元素
  var myp = new ParagraphElement(); // 实例化一个ParagraphElement
  myp..id = 'myId'
  ..text = 'Paragraph Element!'
  ..title = 'ParagraphElement'
  ..lang = 'EN';
  document.body.nodes.add(myp);// 新增元素
  // 获取父元素和子元素parent child
  var childId = querySelector('#childId');
  print(childId.parent.tagName);
  print(childId.parent.id);
  // DOM 元素的事件。添加事件处理的语法：element.on[‘event’].listen
  // 1. 监听输入框的KeyUp Event。
  var input = querySelector('#inputContent');
  input.onKeyDown.listen((KeyboardEvent e) {
    print(e.keyCode);
  });
  // 操作css样式
  // 1、将这些操作集中到了CssClassSet类中
  var element = querySelector('#myId');
  element.classes.add('selected'); // 添加样式
  element.classes.toggle('isOnline'); // 切换样式
  element.classes.remove('selected'); // 删除样式
  element.classes.clear();

  // 2. 通过CssStyleDeclaration类显式声明
  element.style.backgroundColor = '#459fc2'; // 设置背景颜色
  element.style.color = '#fff';
  element.style.fontSize = '18px';

  // 添加按钮，控制页面元素的类进行变化
  var btn1 = new ButtonElement()
  ..id = 'btn1'
  ..text = 'ERROR'
  ..onClick.listen((event) {
    childId.classes
        ..clear()
        ..add('error');
    childId.text = 'this is an error message!';
  });
  var btn2 = new ButtonElement()
  ..id = 'btn2'
  ..text = 'WARNING'
  ..onClick.listen((event) {
    childId.classes
        ..clear()
        ..add('warning');
    childId.text = 'this is a warning message';
  });
  var btn3 = new ButtonElement()
  ..id = 'btn3'
  ..text = 'SUCCESS'
  ..onClick.listen((event) {
    childId.classes
        ..clear()
        ..add('success');
    childId.text = 'this is a success message';
  });
  var btn4 = new ButtonElement()
  ..id = 'btn4'
  ..text = 'TOGGLE'
  ..onClick.listen((event) {
    childId.classes.toggle('toggle');
    childId.text = 'Toggle!';
  });
  var btn5 = new ButtonElement()
  ..id = "btn5"
  ..text = 'fade'
  ..onClick.listen((event) {
    childId.classes
        ..clear()
        ..add('fade-in');
  });
  var btn6 = new ButtonElement()
  ..id = 'btn6'
  ..text = 'fase-out'
  ..onClick.listen((event) {
    childId.classes
        ..clear()
        ..add('fade-out');
  });
  document.body.nodes.addAll([btn1, btn2, btn3, btn4, btn5, btn6]);
  var circle = querySelector('#circle');
  new Timer.periodic(new Duration(seconds: 1), (_){
    circle.classes.toggle('big-circle');
  });

}
