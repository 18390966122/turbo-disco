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
  text.replaceWith(div);
  var myp = new ParagraphElement(); // 实例化一个ParagraphElement
  myp..id = 'myId'
  ..text = 'Paragraph Element!'
  ..title = 'ParagraphElement'
  ..lang = 'EN';
  document.body.nodes.add(myp);

}