import 'dart:io';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'dart:async';

void main() {
  var systemTempDir = Directory.systemTemp;
//  创建文件
  new File('${systemTempDir.path}/read.txt').create(recursive: true).then((file) {
    print(file.path);
  });

  // 以字符串的方式读取文件
  new File('${systemTempDir.path}/read.txt').readAsString().then((String contents) {
    print(contents);
  });

  // 以列表的形式读取文件
  new File('${systemTempDir.path}/read.txt').readAsLines().then((List<string> lines) {
    print(lines);
  });

  // 以字节读取文件
  new File('${systemTempDir.path}/read.txt').readAsBytes().then((bytes) {
//    var base64 = CryptoUtils.bytesToBase64();
//    print(base64);
  print(bytes);
  });

  // 以流的形式读取文件
  final file = new File('${systemTempDir.path}/read.txt');
  Stream<List<int>> inputStream = file.openRead();
  inputStream
  // 解码为UTF8
      .transform(UTF8.decoder)
  // 流转换为列表
      .transform(new LineSplitter())
  // 设置输出
      .listen((String line) {
        print('${line}有${line.length}个字节');
  },
      onDone: () {print('文件已关闭');},
      // 出错时输出错误信息
      onError: (e) {print(e.toString());});

  // 将字符串写入文件中
  file.writeAsString('add contents').then((File file) {
    file.readAsString().then(print);
  });

  // 将字节写入文件
  final str = 'write a message';
  var encodeData = UTF8.encode(str);
  file.writeAsBytes(encodeData).then((content) {
    print(content.readAsBytes().then(print));
  });

  // 将流写入文件
  //创建一个新的IOSink
  var sink = file.openWrite();
  //将对象转成字符串，并写入文件
  sink.write('add a file message');
  //关闭IOSink释放系统资源
  sink.close();


}