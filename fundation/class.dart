class Point {
  num x;
  num y;
  num z;
  Point (this.x, this.y, z) {// //第一个值传递给this.x，第二个值传递给this.y
    this.z = z;
  }
  /*Point.formlist(var list): // 命名构造函数，格式为Class.name(var param) 使用冒号初始化变量
      x = list[0],
      y = list[1],
      z = list[2]{}
  */
  Point.formList(var list):this(list[0], list[1], list[2]); // 构造函数的简写
  String toString() => 'x: $x\ny: $y\nz: $z';
}
/*class ImmutablePoint {
  final num x;
  final num y;
  const ImmutablePoint(this.x, this.y); // 常量构造函数
  static final ImmutablePoint origin = const ImmutablePoint(0, 0); // 创建一个常量对象不能用new，要用const
}*/

class Rectangle {
  num left;
  num top;
  num width;
  num height;
  Rectangle(this.left, this.top, this.width, this.height);
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}
abstract class Shape { // 定义了一个Shape方法，这是一个接口/类
  num perimeter(); // 这是一个隐式函数
}
class Rectangle2 implements Shape { // 调用了抽象接口/类
  final num height, width;
  Rectangle2(num this.height, num this.width); // 紧凑的构造函数语法
  num perimeter() => 2 * width + 2 * height; // 实现了Shape接口的perimeter方法
}
class Square extends Rectangle2 { // 继承
  Square(num size) : super(size, size); // 调用超类的函数
}
// 工厂构造函数 factory
class Logger {
  final String name;
  bool mute = false;

  // 变量前加下划线表示私有属性
  static final Map<String, Logger> _cache = <String, Logger>{};
  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}
/*class Logger {
  final String name;
  bool mute = false;

  // 变量前加下划线表示私有属性
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}*/
void main() {
  // 构造函数
  var p1 = new Point(1, 2, 3);
  var p2 = new Point.formList([5, 2, 3]);
  print(p1);
  print(p2);
  var rect = new Rectangle(3, 4, 20, 15);
  print(rect.left);print(rect.right);print(rect.top);print(rect.bottom);

  var s1 = new Square(2);
  print(s1.perimeter());
  var l = new Logger('UI');
  l.log('button');
  print(l.name);
}
