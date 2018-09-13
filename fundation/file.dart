import 'dart:io';

void main() {
  var systemTempDir = Directory.systemTemp;
  print(systemTempDir.path); // 打印系统的临时文件路径

  // 创建一个临时文件并且删除
  Directory.systemTemp.createTemp('my_temp_file').then((directory) {
    directory.exists().then(print); // 这里返回true，因为是存在的
    return directory.delete();
  }).then((directory) {
    directory.exists().then(print); // 这里返回false，因为在运行到这里来的时候就已经把文件删掉了
  });

  // 冲命名一个文件的路径和链接
  new File('${systemTempDir.path}/foo.txt').create().then((file) {
    print('文件的路径${file.path}');
    return file.rename('${systemTempDir.path}/bar.txt');
  }).then((file) {
    print(file.path);
  });

  // 查看文件对象类型
  Directory.systemTemp.list(recursive: true, followLinks: false)
  ..listen((FileSystemEntity entity) {
    FileSystemEntity.type(entity.path).then((FileSystemEntityType type) {
      String label;
      switch (type) {
        case FileSystemEntityType.DIRECTORY:
          label = '目录';
          break;
        case FileSystemEntityType.FILE:
          label = '文件';
          break;
        case FileSystemEntityType.LINK:
          label = '链接';
          break;
        default:
          lable = '其他';
          break;
      }
      print('${label}: ${entity.path}');
      // 输出符父文件目录
      print('parent: ${entity.parent.path}');
    });
  });

}
