void main() {
  // 这个语言必须要加上分号结尾 ，否则会报错
  // 使用三个引号定义多行字符串
  var str = """haha
  hahaha""";
  // 使用空格连接字符串
  var name1 = 'sherrie' 'cao';
  // 内内置断言 如果是错误的话，将会中断整个程序的执行
//  assert(name1 == "Wang Jianfei");
  var hex = 0xDEADBEEF;
//  print("整型转换为16进制：$hex —> 0x${hex.toRadixString(16).toUpperCase()}");
//  print(str);
//  print(name1);

//  定义常量
//  现在dart 已经不支持const var和final var了，必须是static const i = 123。
  const list = const[1, 2, 3];
//  const list2 = [1, 2, 3];  // 如果是这样定义就会报错
print(list); // 这里不会报错
}
