import 'package:http_server/http_server.dart' show VirtualDirectory;
import 'dart:io';
void main () {
 //绑定一个IPv4的HttpServer，设置8089端口
 HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8089).then((server) {
    print('serving at ${server.address}: ${server.port}');
    server.listen((httpRequest request) {
    // HttpResponse对象用于返回客户端
        request.response
        // 获取和设置内容类型（报头）
        ..headers.contentType=new ContentType('text','plain',charset:'utf-8')
        // 通过调用Object.toString将Object转换为一个字符串并转成对应编码发送到客户端
        ..write('hello sherrie :)')
        // 结束与客户端连接
        ..close();
    });
 });
   //设置根路径
  final MY_HTTP_ROOT_PATH = Platform.script.resolve('web').toFilePath();
  //从根路径获取文件和目录清单
  final virDir = new VirtualDirectory(MY_HTTP_ROOT_PATH)
    //是否获取文件和目录清单，为false则不获取
    ..allowDirectoryListing = true;
  HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8085).then((server){
    server.listen((request){
      //将文件和目录清单发送到客户端
      virDir.serveRequest(request);
    });
  });
}



