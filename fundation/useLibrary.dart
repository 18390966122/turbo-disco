// 导入库
//  dart表示标准库
//import 'dart:class.dart';
// 使用相对路径或者觉得路径来引入库
//import 'lib/student/student.dart';
//Pub包管理系统中有很多功能强大、实用的库，可以使用前缀 package:
//import 'package:args/args.dart';

// 当各个库有命名冲突的时候，可以使用as关键字来使用命名空间
/*import 'lib/student/student.dart' as Stu;
Stu.Student s = new Stu.Student();*/

// import 'lib/student/student.dart' show Person, Student; // show关键字可以显示某个成员
// import 'lib/student/student.dart' hide Person, Student; //hide关键字可以隐藏某个成员

// library person  // library 定义这个库的名字，但库的名字并不影响导入，因为import语句用的是字符串Uri
// 可以多用library、part加字符串类型的Uri类似include，表示包含某个文件，part of加库名表示该文件属于那个库
/*library match;
part 'main.dart';
part 'class.dart';
// point.dart文件开头
part of match;
// random.dart文件开头
part of match;*/


